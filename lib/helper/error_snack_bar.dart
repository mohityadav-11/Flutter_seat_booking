import 'package:get/get.dart';
import 'package:flutter/material.dart';

errorSnackBar(String error) {
  Get.snackbar(
    "Invalid Input",
    error,
    margin: EdgeInsets.all(15),
    icon: Icon(Icons.error_outline, color: Colors.red),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Get.theme.scaffoldBackgroundColor,
  );
}
