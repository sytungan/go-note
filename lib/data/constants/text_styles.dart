import 'package:flutter/material.dart';
import 'package:gonote/data/constants/colors.dart';

class TextStyles {
  TextStyles._();

  static TextStyle get noteTitle => const TextStyle(
      fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.quartz);

  static TextStyle get noteContent =>
      const TextStyle(fontSize: 14, color: AppColors.gray);

  static TextStyle get subDescription => const TextStyle(
        fontSize: 13,
        color: AppColors.mediumGray,
        fontStyle: FontStyle.italic,
      );

  static TextStyle get normalText => const TextStyle(
      fontSize: 14, color: AppColors.quartz, fontWeight: FontWeight.w500);

  static TextStyle get appBarTitle => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.quartz,
      );
}
