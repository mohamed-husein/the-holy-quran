import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:quran_app/core/services/service_locator.dart';
import 'package:quran_app/core/services/shared_preferences_services.dart';
import 'package:quran_app/core/utils/app_constants.dart';

import '../../quran/business/theme/app_theme.dart';


class ServiceInitializer {
  ServiceInitializer._();

  static final ServiceInitializer instance = ServiceInitializer._();

  factory ServiceInitializer() => instance;
  static late Locale locale;
  static late AppTheme savedAppTheme;

  initializeSettings() async {
    await initializeDependencyInjection();
    List futures = [
      getStoredAppTheme(),
    ];
    await Future.wait<dynamic>([...futures]);
  }

  initializeDependencyInjection() async {
    await DependencyInjectionServices().init();
  }


  Future getStoredAppTheme() async {
    savedAppTheme = await sl<SharedPreferencesServices>()
        .getData(key: AppConstants.themeKey, dataType: DataType.int)
        .then((value) =>
            value == null ? _getSystemTheme() : AppTheme.values[value]);
  }

  AppTheme _getSystemTheme() {
    return SchedulerBinding.instance.window.platformBrightness ==
            Brightness.light
        ? AppTheme.light
        : AppTheme.dark;
  }
}
