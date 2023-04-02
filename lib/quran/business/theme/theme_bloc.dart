import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/services/service_locator.dart';
import '../../../core/services/shared_preferences_services.dart';
import '../home_cubit/quran_cubit.dart';
import 'app_theme.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeData themeData;
  bool isDark = true;
  static ThemeBloc get(context) => BlocProvider.of(context);
  ThemeBloc({required this.themeData}) : super(ThemeState(themeData)) {
    on<SaveThemeEvent>(
      (event, emit) async {
        await saveTheme(event.appTheme);
        emit(
          ThemeState(
            appThemeData[event.appTheme]!,
          ),
        );
        sl<QuranCubit>()
                ..getSurahData()
                ..getLastRead();
      },
    );
    on<ChangeTheme>((event, emit) {
      emit(const ChangeThemeState());
      isDark = !isDark;
      emit(const ChangeThemeState());
    });
  }

  saveTheme(AppTheme appTheme) async {
    await sl<SharedPreferencesServices>().saveData(
      key: 'THEME_KEY',
      value: appTheme.index,
      dataType: DataType.int,
    );
  }
}
