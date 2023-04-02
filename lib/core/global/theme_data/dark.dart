import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/app_fonts.dart';
import '../../utils/app_sizes.dart';
import '../theme_color/theme_color_dark.dart';
import '../theme_color/theme_color_light.dart';

ThemeData get getThemeDataDark => ThemeData(
      primaryColor: ThemeColorDark.primaryColor,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: ThemeColorDark.scaffoldColor,
      fontFamily: AppFonts.fontFamily,
      disabledColor: ThemeColorDark.disableColor,
      errorColor: ThemeColorDark.errorColor,
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: ThemeColorDark.primaryColor,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: ThemeColorDark.scaffoldColor,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light
            .copyWith(statusBarColor: ThemeColorDark.black),
        iconTheme: const IconThemeData(color: ThemeColorDark.white),
      ),

      /// TextFormField
      inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(AppSizes.br30)),
          fillColor: ThemeColorDark.fillColorTextFormField,
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  width: AppSizes.bs0_5,
                  color: ThemeColorDark.focusBorderTextField),
              borderRadius: BorderRadius.circular(AppSizes.br30)),
          errorStyle: TextStyle(
            color: ThemeColorDark.validationTextFieldColor,
            fontSize: AppSizes.fs16,
            fontWeight: AppFonts.regular,
          ),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(AppSizes.br30))),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: ThemeColorDark.primaryColor),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(AppSizes.br25))),
        ),
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

      // textTheme: const TextTheme(
      //   bodyText1: TextStyle(
      //     color: Colors.white,
      //   ),
      // ),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.br40),
        )),
        overlayColor: MaterialStateProperty.all<Color>(
          Colors.transparent,
        ),
      )),
      textTheme: TextTheme(
      /// Primary Color Light
      displaySmall: TextStyle(
        color: ThemeColorLight.lightPurpleColor,
        fontSize: AppSizes.fs16,
        fontWeight: AppFonts.regular,
        fontFamily: AppFonts.fontFamilyKatib,
      ),

      /// Primary Color AppBar
      displayMedium: TextStyle(
        color: ThemeColorDark.white,
        fontSize: AppSizes.fs20,
        fontWeight: AppFonts.semiBlod,
        fontFamily: AppFonts.fontFamily,
      ),
      displayLarge: TextStyle(
        color: ThemeColorDark.white,
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
        color: ThemeColorLight.white,
        fontSize: AppSizes.fs16,
        fontWeight: AppFonts.regular,
        fontFamily: AppFonts.fontFamily,
      ),
      bodyMedium: TextStyle(
        color: ThemeColorLight.white,
        fontSize: AppSizes.fs18,
        fontWeight: AppFonts.regular,
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
        fontWeight: AppFonts.regular,
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
    ),
      tabBarTheme: TabBarTheme(
        labelColor: ThemeColorLight.white,
        labelStyle: TextStyle(
          fontWeight: AppFonts.semiBlod,
          fontSize: AppSizes.fs16,
          color: ThemeColorLight.white,
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
        color: ThemeColorLight.lightPurpleColor,
        fontSize: AppSizes.fs16,
        fontWeight: AppFonts.regular,
        fontFamily: AppFonts.fontFamilyKatib,
      ),

      /// Primary Color AppBar
      displayMedium: TextStyle(
        color: ThemeColorDark.white,
        fontSize: AppSizes.fs20,
        fontWeight: AppFonts.semiBlod,
        fontFamily: AppFonts.fontFamily,
      ),
      displayLarge: TextStyle(
        color: ThemeColorDark.white,
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
        color: ThemeColorLight.white,
        fontSize: AppSizes.fs16,
        fontWeight: AppFonts.regular,
        fontFamily: AppFonts.fontFamily,
      ),
      bodyMedium: TextStyle(
        color: ThemeColorLight.white,
        fontSize: AppSizes.fs18,
        fontWeight: AppFonts.regular,
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
        fontWeight: AppFonts.regular,
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
