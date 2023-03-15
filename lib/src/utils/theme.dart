import 'package:flutter/material.dart';
import 'package:flutter_app_testing/src/utils/widget_themes/text_theme.dart';
import 'package:google_fonts/google_fonts.dart';
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