import 'package:flutter/material.dart';

import '../../../core/global/theme_data/dark.dart';
import '../../../core/global/theme_data/light.dart';

enum AppTheme {
  light,
  dark,
}

final Map<AppTheme, ThemeData> appThemeData = {
  AppTheme.light: getThemeDataLight,
  AppTheme.dark: getThemeDataDark,
};