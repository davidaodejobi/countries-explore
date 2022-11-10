import 'package:flutter/material.dart';

import '../../constant/constant.dart';

class AppTheme extends ChangeNotifier {
  static ThemeData light() {
    return ThemeData.light().copyWith(
      // useMaterial3: true,
      iconTheme: const IconThemeData(
        color: AppColor.lightSecondaryColor,
      ),
      scaffoldBackgroundColor: AppColor.lightBackgroundColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: const Color(0xFFFDFDFC),
          backgroundColor: AppColor.logoDotColor, // foreground (text) color
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
      ),
      appBarTheme: const AppBarTheme(
        color: AppColor.lightBackgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(
          color: AppColor.lightSecondaryColor,
        ),
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: AppColor.lightSecondaryColor,
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(
          fontSize: 72.0,
          fontFamily: 'Inter',
          color: AppColor.lightSecondaryColor,
          fontWeight: FontWeight.bold,
        ),
        headline2: TextStyle(
          fontSize: 36.0,
          fontFamily: 'Inter',
          color: AppColor.lightSecondaryColor,
          fontWeight: FontWeight.normal,
        ),
        headline3: TextStyle(
          fontSize: 27.0,
          fontFamily: 'Inter',
          color: AppColor.lightSecondaryColor,
          fontWeight: FontWeight.w500,
        ),
        headline4: TextStyle(
          fontSize: 22.0,
          fontFamily: 'Inter',
          color: AppColor.lightSecondaryColor,
          fontWeight: FontWeight.normal,
        ),
        headline5: TextStyle(
          fontSize: 18.0,
          fontFamily: 'Inter',
          color: AppColor.lightSecondaryColor,
          fontWeight: FontWeight.normal,
        ),
        headline6: TextStyle(
          fontSize: 16.0,
          fontFamily: 'Inter',
          color: AppColor.lightSecondaryColor,
          fontWeight: FontWeight.normal,
        ),
        bodyText1: TextStyle(
          fontSize: 14.0,
          fontFamily: 'Inter',
          color: AppColor.lightSecondaryColor,
          fontWeight: FontWeight.w400,
        ),
        bodyText2: TextStyle(
          fontSize: 12.0,
          fontFamily: 'Inter',
          color: AppColor.lightSecondaryColor,
          fontWeight: FontWeight.w400,
        ),
        subtitle1: TextStyle(
          fontSize: 14.0,
          fontFamily: 'Inter',
          color: AppColor.lightSecondaryColor,
          fontWeight: FontWeight.w300,
        ),
        caption: TextStyle(
          fontSize: 12.0,
          fontFamily: 'Inter',
          color: AppColor.lightSecondaryColor,
          fontWeight: FontWeight.w400,
        ),
        overline: TextStyle(
          fontSize: 12.0,
          fontFamily: 'Inter',
          color: AppColor.lightSecondaryColor,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  static ThemeData dark() {
    return ThemeData.light().copyWith(
      // useMaterial3: true,
      iconTheme: const IconThemeData(
        color: AppColor.darkSecondaryColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: const Color(0xFFF2F4F7),
          backgroundColor:
              AppColor.logoDotColor.withOpacity(0.8), // foreground (text) color
        ),
      ),
      scaffoldBackgroundColor: const Color(0xFF091C32),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
      ),
      appBarTheme: const AppBarTheme(
        color: Color(0xFFC5C5C5),
        elevation: 0,
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(
          fontSize: 72.0,
          fontFamily: 'Inter',
          color: AppColor.darkSecondaryColor,
          fontWeight: FontWeight.bold,
        ),
        headline2: TextStyle(
          fontSize: 36.0,
          fontFamily: 'Inter',
          color: AppColor.darkSecondaryColor,
          fontWeight: FontWeight.normal,
        ),
        headline3: TextStyle(
          fontSize: 27.0,
          fontFamily: 'Inter',
          color: AppColor.darkSecondaryColor,
          fontWeight: FontWeight.w500,
        ),
        headline4: TextStyle(
          fontSize: 22.0,
          fontFamily: 'Inter',
          color: AppColor.darkSecondaryColor,
          fontWeight: FontWeight.normal,
        ),
        headline5: TextStyle(
          fontSize: 18.0,
          fontFamily: 'Inter',
          color: AppColor.darkSecondaryColor,
          fontWeight: FontWeight.normal,
        ),
        headline6: TextStyle(
          fontSize: 16.0,
          fontFamily: 'Inter',
          color: AppColor.darkSecondaryColor,
          fontWeight: FontWeight.normal,
        ),
        bodyText1: TextStyle(
          fontSize: 14.0,
          fontFamily: 'Inter',
          color: AppColor.darkSecondaryColor,
          fontWeight: FontWeight.w400,
        ),
        bodyText2: TextStyle(
          fontSize: 12.0,
          fontFamily: 'Inter',
          color: AppColor.darkSecondaryColor,
          fontWeight: FontWeight.w400,
        ),
        subtitle1: TextStyle(
          fontSize: 14.0,
          fontFamily: 'Inter',
          color: AppColor.darkSecondaryColor,
          fontWeight: FontWeight.w300,
        ),
        caption: TextStyle(
          fontSize: 12.0,
          fontFamily: 'Inter',
          color: AppColor.darkSecondaryColor,
          fontWeight: FontWeight.w400,
        ),
        overline: TextStyle(
          fontSize: 12.0,
          fontFamily: 'Inter',
          color: AppColor.darkSecondaryColor,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  static bool _isDarkTheme = ThemeMode.system == ThemeMode.dark ? true : false;
  bool get isDarkTheme => _isDarkTheme;

  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }
}
