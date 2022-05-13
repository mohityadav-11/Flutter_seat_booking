import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../theme/themes.dart';

class AppColors {
  static Color get grey =>
      Get.isDarkMode ? Colors.grey[700]! : Colors.grey[300]!;

  static Color get selected => Themes.primaryColor;
  static Color get reserved => Colors.blueAccent;
  static Color get available => Colors.green;
  static Color get notAvailable => Colors.grey;

  static Color get blackOrWhite => Get.isDarkMode ? Colors.white : Colors.black;
}
