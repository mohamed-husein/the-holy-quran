part of 'theme_mode_cubit.dart';

abstract class ThemeModeState extends Equatable {
  const ThemeModeState();

  @override
  List<Object> get props => [];
}

class ThemeModeInitial extends ThemeModeState {}
class ChangeMode extends ThemeModeState {}


