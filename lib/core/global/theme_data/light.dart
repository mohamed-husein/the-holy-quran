import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/app_fonts.dart';
import '../../utils/app_sizes.dart';
import '../theme_color/theme_color_light.dart';

ThemeData get getThemeDataLight => ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primaryColor: ThemeColorLight.primaryColor,
      brightness: Brightness.light,
      primaryIconTheme: const IconThemeData(
        color: ThemeColorLight.black,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: ThemeColorLight.white,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark
            .copyWith(statusBarColor: ThemeColorLight.white),
        iconTheme: const IconThemeData(color: ThemeColorLight.black),
      ),
      fontFamily: AppFonts.fontFamily,
      textTheme: getTextTheme(),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: ThemeColorLight.primaryColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.br40),
          )),
          backgroundColor:
              MaterialStateProperty.all(ThemeColorLight.buttonColor),
        ),
      ),
      tabBarTheme: TabBarTheme(
        labelColor: ThemeColorLight.primaryColor,
        labelStyle: TextStyle(
          fontWeight: AppFonts.semiBlod,
          fontSize: AppSizes.fs16,
          color: ThemeColorLight.primaryColor,
          fontFamily: AppFonts.fontFamily,
        ),
        unselectedLabelStyle: TextStyle(
          fontWeight: AppFonts.semiBlod,
          fontSize: AppSizes.fs16,
          fontFamily: AppFonts.fontFamily,
        ),
        unselectedLabelColor: ThemeColorLight.grey,
      ),
    );

getTextTheme() => TextTheme(
      /// Primary Color Light
      displaySmall: TextStyle(
        color: ThemeColorLight.primaryColor,
        fontSize: AppSizes.fs18,
        fontWeight: AppFonts.semiBlod,
        fontFamily: AppFonts.fontFamilyKatib,
      ),

      /// Primary Color AppBar
      displayMedium: TextStyle(
        color: ThemeColorLight.primaryColor,
        fontSize: AppSizes.fs22,
        fontWeight: AppFonts.semiBlod,
        fontFamily: AppFonts.fontFamily,
      ),
      displayLarge: TextStyle(
        color: ThemeColorLight.primaryColor,
        fontSize: AppSizes.fs26,
        fontWeight: AppFonts.semiBlod,
        fontFamily: AppFonts.fontFamily,
      ),

      headlineLarge: TextStyle(
        color: ThemeColorLight.grayscale,
        fontSize: AppSizes.fs48,
        fontWeight: AppFonts.regular,
        fontFamily: AppFonts.fontFamily,
      ),
      headlineMedium: TextStyle(
        color: ThemeColorLight.grayscale,
        fontSize: AppSizes.fs32,
        fontWeight: AppFonts.regular,
        fontFamily: AppFonts.fontFamily,
      ),
      headlineSmall: TextStyle(
        color: ThemeColorLight.grayscale,
        fontSize: AppSizes.fs24,
        fontWeight: AppFonts.regular,
        fontFamily: AppFonts.fontFamily,
      ),

      /// Body For Text in Black Color
      bodySmall: TextStyle(
        color: ThemeColorLight.black,
        fontSize: AppSizes.fs14,
        fontWeight: AppFonts.semiBlod,
        fontFamily: AppFonts.fontFamily,
      ),
      bodyMedium: TextStyle(
        color: ThemeColorLight.black,
        fontSize: AppSizes.fs16,
        fontWeight: AppFonts.semiBlod,
        fontFamily: AppFonts.fontFamily,
      ),
      bodyLarge: TextStyle(
        color: ThemeColorLight.black,
        fontSize: AppSizes.fs20,
        fontWeight: AppFonts.regular,
        fontFamily: AppFonts.fontFamily,
      ),

      /// Title
      titleSmall: TextStyle(
        color: ThemeColorLight.white,
        fontSize: AppSizes.fs12,
        fontWeight: AppFonts.regular,
        fontFamily: AppFonts.fontFamily,
      ),

      /// White Text For Button
      titleMedium: TextStyle(
        color: ThemeColorLight.white,
        fontSize: AppSizes.fs14,
        fontWeight: AppFonts.semiBlod,
        fontFamily: AppFonts.fontFamily,
      ),
      titleLarge: TextStyle(
        color: ThemeColorLight.white,
        fontSize: AppSizes.fs18,
        fontWeight: AppFonts.semiBlod,
        fontFamily: AppFonts.fontFamily,
      ),

      /// Label For Color Grey
      labelSmall: TextStyle(
        color: ThemeColorLight.labelColor,
        fontSize: AppSizes.fs11,
        fontWeight: AppFonts.semiBlod,
        fontFamily: AppFonts.fontFamily,
      ),

      labelMedium: TextStyle(
        color: ThemeColorLight.labelColor,
        fontSize: AppSizes.fs16,
        fontWeight: AppFonts.regular,
        fontFamily: AppFonts.fontFamily,
      ),

      labelLarge: TextStyle(
        color: ThemeColorLight.labelColor,
        fontSize: AppSizes.fs18,
        fontWeight: AppFonts.regular,
        fontFamily: AppFonts.fontFamily,
      ),
    );
