import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_mode_state.dart';

class ThemeModeCubit extends Cubit<ThemeModeState> {
  ThemeModeCubit() : super(ThemeModeInitial());
  static ThemeModeCubit get(context) => BlocProvider.of(context);
  bool isDark = false;

  void changeMode() {
    emit(ChangeMode());
    isDark = !isDark;
    emit(ChangeMode());
  }
}
