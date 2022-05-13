import 'package:flutter/material.dart';
import 'hex_code.dart';


class Themes {

  static Color get primaryColor => Colors.orange[700]!;
  static Color get secondaryColor => Colors.grey[800]!;
  static Color get lightBackgroundColor => HexColor("#F5F5F5");
  static Color get darkBackgroundColor => HexColor('#1a1a1a');


  /// data for light theme
  static final light = ThemeData.light().copyWith(
    scaffoldBackgroundColor: lightBackgroundColor,
    primaryColor: primaryColor,
    secondaryHeaderColor: secondaryColor
  );

  /// data for dark theme
  static final dark = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: darkBackgroundColor,
    primaryColor: primaryColor,
    secondaryHeaderColor: secondaryColor
  );
}