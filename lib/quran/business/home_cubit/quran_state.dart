part of 'quran_cubit.dart';

abstract class QuranState extends Equatable {
  const QuranState();

  @override
  List<Object> get props => [];
}

class QuranInitial extends QuranState {}

class ChangeAudioState extends QuranState {}

class ChangeAudioToPauseState extends QuranState {}

class GetSurahDataSuccessState extends QuranState {
  final List<SurahModel> surahModel;

  const GetSurahDataSuccessState({required this.surahModel});
  @override
  List<Object> get props => [surahModel];
}

class GetSurahDataErrorState extends QuranState {
  final String error;

  const GetSurahDataErrorState({required this.error});
  @override
  List<Object> get props => [error];
}

class GetSurahDetailsDataSuccessState extends QuranState {
  final SurahDetailsModel surahDetailsModel;

  const GetSurahDetailsDataSuccessState({required this.surahDetailsModel});
  @override
  List<Object> get props => [surahDetailsModel];
}

class GetSurahDetailsDataErrorState extends QuranState {
  final String error;

  const GetSurahDetailsDataErrorState({required this.error});
  @override
  List<Object> get props => [error];
}

class GetAllJuzSuccessState extends QuranState {
  final JuzModel juz;

  const GetAllJuzSuccessState({required this.juz});
  @override
  List<Object> get props => [juz];
}

class GetAllSurahInJuzSuccessState extends QuranState {
  @override
  List<Object> get props => [];
}

class GetAllJuzErrorState extends QuranState {
  final String error;

  const GetAllJuzErrorState({required this.error});
  @override
  List<Object> get props => [error];
}

class ChangeThemeState extends QuranState {
  const ChangeThemeState();
 

  @override
  List<Object> get props => [];
}

class InsertBookmarkSuccessState extends QuranState {}
class InsertSuccessState extends QuranState {}

class InsertBookmarkErrorState extends QuranState {
  final String error;

  const InsertBookmarkErrorState({required this.error});
  @override
  List<Object> get props => [error];
}

class InsertLastReadSuccessState extends QuranState {}

class InsertLastReadErrorState extends QuranState {
  final String error;

  const InsertLastReadErrorState({required this.error});
  @override
  List<Object> get props => [error];
}

class GetBookmarkSuccessState extends QuranState {}

class GetBookmarkErrorState extends QuranState {
  final String error;

  const GetBookmarkErrorState({required this.error});
  @override
  List<Object> get props => [error];
}

class GetLastReadLoadingState extends QuranState {}

class GetLastReadSuccessState extends QuranState {


}


class GetLastReadErrorState extends QuranState {
  final String error;

  const GetLastReadErrorState({required this.error});
  @override
  List<Object> get props => [error];
}

class DeleteBookmarkSuccessState extends QuranState {


}
class DeleteBookmarkErrorState extends QuranState {
  final String error;

  const DeleteBookmarkErrorState({required this.error});
  @override
  List<Object> get props => [error];
}

