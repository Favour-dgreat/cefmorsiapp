import 'package:flutter/material.dart';
import 'package:CMI/src/utils/widget_themes/text_theme.dart';
class AppTheme{
  AppTheme._();
  static  ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  textTheme: AppTextTheme.lightTextTheme
  );
  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      textTheme: AppTextTheme.darkTextTheme
  );
}