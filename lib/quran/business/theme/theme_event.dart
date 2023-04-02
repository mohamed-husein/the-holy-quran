part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object?> get props => [];
}

class SaveThemeEvent extends ThemeEvent {
  final AppTheme appTheme;

  const SaveThemeEvent({required this.appTheme});
}

class ChangeTheme extends ThemeEvent {
  const ChangeTheme();
}
