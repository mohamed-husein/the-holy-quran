import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quickalert/quickalert.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../../../core/error/failure.dart';
import '../../../core/utils/app_constants.dart';
import '../../data/model/database_model.dart';
import '../../data/model/juz_model.dart';
import '../../data/model/surah_details_model.dart';
import '../../data/model/surah_model.dart';
import '../../data/model/verses_model.dart';
import '../../data/repository/quran_repository.dart';

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  final QuranRepository quranRepository;
  QuranCubit({required this.quranRepository}) : super(QuranInitial());

  static QuranCubit get(context) => BlocProvider.of(context);
  AutoScrollController controller = AutoScrollController();

  List<SurahModel> _surah = [];
  List<SurahModel> get surah => _surah;

  SurahDetailsModel? _surahDetailsModel;
  SurahDetailsModel? get surahDetailsModel => _surahDetailsModel;

  Future<void> getSurahData() async {
    final result = await quranRepository.getSurahData();

    result.fold(
      (l) {
        emit(
          GetSurahDataErrorState(
            error: _handeErrorMessage(l),
          ),
        );
      },
      (r) {
        _surah = r;
        emit(GetSurahDataSuccessState(surahModel: r));
      },
    );
  }

  Future<void> getSurahDetailsData(int surahNumber) async {
    final result = await quranRepository.getSurahDetailsData(surahNumber);

    result.fold((l) {
      emit(
        GetSurahDetailsDataErrorState(
          error: _handeErrorMessage(l),
        ),
      );
    }, (r) {
      _surahDetailsModel = r;
      emit(GetSurahDetailsDataSuccessState(surahDetailsModel: r));
    });
  }

  // saveTheme(AppTheme appTheme) async {
  //   await sl<SharedPreferencesServices>().saveData(
  //     key: AppConstants.themeKey,
  //     value: appTheme.index,
  //     dataType: DataType.int,
  //   );
  //   emit(ChangeThemeState(themeData: appThemeData[appTheme]!));
  // }

  JuzModel? _allJuz;
  JuzModel? get getAllJuz => _allJuz;

  Future<void> getAllJuzData(int juzNum) async {
    final result = await quranRepository.getAllJuz(juzNum);
    result.fold((l) {
      emit(
        GetAllJuzErrorState(
          error: _handeErrorMessage(l),
        ),
      );
    }, (r) {
      _allJuz = r;
      emit(GetAllJuzSuccessState(juz: r));
    });
  }

  List<SurahModel> allSurahInJuz = [];

  int index = 0;
  final player = AudioPlayer();

  VersesModel? lastVerse;

  void playAudio(VersesModel versesModel, context) async {
    if (versesModel.audio.isNotEmpty) {
      try {
        lastVerse ??= versesModel;
        lastVerse!.audioState = 'stop';
        versesModel.audioState = 'playing';
        emit(ChangeAudioState());
        await player.setUrl(versesModel.audio);
        await player.play();
        versesModel.audioState = 'stop';
        await player.stop();
        emit(ChangeAudioToPauseState());
      } on PlayerException catch (e) {
        QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            text: "Error message: ${e.message}");
      } on PlayerInterruptedException catch (e) {
        QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            text: "Connection aborted: ${e.message}");
      } catch (e) {
        QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            text: 'An error occured: $e');
      }
    } else {
      QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          text: "Url Audio not valid");
    }
  }

  void pauseAudio(VersesModel versesModel, context) async {
    try {
      await player.pause();
      versesModel.audioState = 'pause';
      emit(ChangeAudioState());
    } on PlayerException catch (e) {
      QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          text: "Error message: ${e.message}");
    } on PlayerInterruptedException catch (e) {
      QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          text: "Connection aborted: ${e.message}");
    } catch (e) {
      QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          text: 'An error occured: $e');
    }
  }

  void resumeAudio(VersesModel versesModel, context) async {
    try {
      versesModel.audioState = 'playing';
      emit(ChangeAudioState());
      await player.play();
      versesModel.audioState == 'stop';
      emit(ChangeAudioState());
    } on PlayerException catch (e) {
      QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          text: "Error message: ${e.message}");
    } on PlayerInterruptedException catch (e) {
      QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          text: "Connection aborted: ${e.message}");
    } catch (e) {
      QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          text: 'An error occured: $e');
    }
  }

  void stopAudio(VersesModel versesModel) async {
    await player.stop();
    versesModel.audioState == 'stop';
    emit(ChangeAudioState());
  }

  String _handeErrorMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return AppConstants.serverFailure;
      default:
        return AppConstants.unExpectedFailure;
    }
  }

  Future<void> insertBookmark(
    DatabaseModel db,
    BuildContext _,
  ) async {
    if (_bookmark.isEmpty) {
      await quranRepository.insertBookmark(db);

      emit(InsertBookmarkSuccessState());
      Get.back();
    } else {
      for (int i = 0; i < _bookmark.length; i++) {
        log("bookMark id ${_bookmark[i][AppConstants.columnId]}");
        log("Model id ${db.id}");
        log("Model id ${_bookmark[i][AppConstants.columnLastRead]}");

        if (_bookmark[i][AppConstants.columnId] == db.id) {
          ScaffoldMessenger.of(_).showSnackBar(
            const SnackBar(
              content: Text('This Ayah already in Bookmark'),
            ),
          );

          emit(InsertBookmarkSuccessState());
          Get.back();
          return;
        } else {
          await quranRepository.insertBookmark(db);
          emit(InsertBookmarkSuccessState());
          Get.back();
        }
      }
    }
    getBookmark();
  }

  Future<void> insertLastRead(DatabaseModel db) async {
    final result = await quranRepository.insertBookmark(db);
    result.fold(
      (l) => emit(InsertLastReadErrorState(error: _handeErrorMessage(l))),
      (r) {
        Get.back();
        emit(InsertLastReadSuccessState());
      },
    );
  }

  List<Map<String, dynamic>> _bookmark = [];
  List<Map<String, dynamic>> get bookmark => _bookmark;

  Map<String, dynamic>? _lastRead;
  Map<String, dynamic>? get lastRead => _lastRead;

  Future<void> getBookmark() async {
    final result = await quranRepository.getBookmark();
    result.fold(
      (l) => emit(
        GetBookmarkErrorState(
          error: _handeErrorMessage(l),
        ),
      ),
      (r) {
        _bookmark = r;
        emit(GetBookmarkSuccessState());
      },
    );
  }

  Future<void> getLastRead() async {
    emit(GetLastReadLoadingState());
    final result = await quranRepository.getLastRead();
    result.fold(
      (l) => emit(
        GetLastReadErrorState(
          error: _handeErrorMessage(l),
        ),
      ),
      (r) {
        _lastRead = r.isEmpty ? null : r.last;
        emit(
          GetLastReadSuccessState(),
        );
      },
    );
  }

  Future<void> deleteBookmark(int id) async {
    final result = await quranRepository.deleteBookmark(id);
    result.fold(
      (l) => emit(
        DeleteBookmarkErrorState(
          error: _handeErrorMessage(l),
        ),
      ),
      (r) {
        emit(
          DeleteBookmarkSuccessState(),
        );
        getBookmark();
      },
    );
  }

  @override
  Future<void> close() {
    player.dispose();
    player.stop();
    return super.close();
  }
}
