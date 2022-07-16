import 'package:flutter/material.dart';
import 'package:gonote/data/constants/colors.dart';

class AppThemes {
  AppThemes._();

  static ThemeData get light => ThemeData(
        appBarTheme: const AppBarTheme(
          foregroundColor: AppColors.white,
          backgroundColor: AppColors.black,
          centerTitle: true,
        ),
        fontFamily: 'Montserrat',
        scaffoldBackgroundColor: AppColors.white,
        backgroundColor: AppColors.white,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      );

  static ThemeData get night => ThemeData(
        appBarTheme: const AppBarTheme(
          foregroundColor: AppColors.white,
          backgroundColor: AppColors.black,
          centerTitle: true,
        ),
        fontFamily: 'Montserrat',
        scaffoldBackgroundColor: AppColors.white,
        backgroundColor: AppColors.white,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      );
}
