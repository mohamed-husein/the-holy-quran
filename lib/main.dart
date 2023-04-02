import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:quran/quran/business/theme/theme_bloc.dart';
import 'package:quran/quran/presentation/screens/home_screen.dart';

import 'core/services/services_initializer.dart';
import 'core/utils/app_constants.dart';
import 'core/utils/import_files.dart';
import 'quran/business/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceInitializer().initializeSettings();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          ThemeBloc(themeData: appThemeData[ServiceInitializer.savedAppTheme]!),
      child: ScreenUtilInit(
        designSize: const Size(393, 851),
        minTextAdapt: false,
        builder: (__, _) {
          return BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return GetMaterialApp(
                title: AppConstants.appTitle,
                debugShowCheckedModeBanner: false,
                theme: state.themeData,
                home: const HomeScreen(),
                builder: (context, child) {
                  return MediaQuery(
                    data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                    child: child!,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
