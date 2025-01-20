import 'package:flutter/material.dart';
import 'package:shop_style/common/configs/colors.dart';

class CustomTheme {
  ThemeData lighTheme = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme.light(
      primary: Color(0xff0D1619),
    ),
    textTheme: const TextTheme(
      //
      titleLarge: TextStyle(
        fontFamily: 'IRANSansDB',
        color: AppColors.black,
        fontWeight: FontWeight.w700,
        fontSize: 28,
      ),
      titleMedium: TextStyle(
        fontFamily: 'IRANSansDB',
        color: AppColors.black,
        fontWeight: FontWeight.w700,
        fontSize: 16,
      ),
      titleSmall: TextStyle(
        fontFamily: 'IRANSansDB',
        color: AppColors.black,
        fontWeight: FontWeight.w700,
        fontSize: 20,
      ),
      ////////////////////////////////////////
      bodyLarge: TextStyle(
        fontFamily: 'IRANSansDB',
        color: AppColors.grey,
        fontWeight: FontWeight.w400,
        fontSize: 20,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'IRANSansDB',
        color: AppColors.black,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
      bodySmall: TextStyle(
        fontFamily: 'IRANSansDB',
        color: AppColors.grey,
        fontWeight: FontWeight.w400,
        fontSize: 16,
      ),
      ////////////////////////////////////////
      displayLarge: TextStyle(
        fontFamily: 'IRANSansDB',
        color: AppColors.grey,
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
      displayMedium: TextStyle(
        fontFamily: 'IRANSansDB',
        color: AppColors.darkYellow,
        fontWeight: FontWeight.w700,
        fontSize: 12,
      ),
      displaySmall: TextStyle(
        fontFamily: 'IRANSansDB',
        color: AppColors.yellow,
        fontWeight: FontWeight.w400,
        fontSize: 12,
      ),
      /////////////////////////////////////
      labelMedium: TextStyle(
        fontFamily: 'IRANSansDB',
        color: AppColors.white,
        fontWeight: FontWeight.w700,
        fontSize: 14,
      ),
      labelSmall: TextStyle(
        fontFamily: 'IRANSansDB',
        color: AppColors.bottomSheetColor,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
      labelLarge: TextStyle(
        fontFamily: 'IRANSansDB',
        color: AppColors.grey2,
        fontWeight: FontWeight.w400,
        fontSize: 10,
      ),
      ////////////////////////////////////
      headlineLarge: TextStyle(
        fontFamily: 'IRANSansDB',
        color: AppColors.black,
        fontWeight: FontWeight.w700,
        fontSize: 24,
      ),
    ),
  );
}
