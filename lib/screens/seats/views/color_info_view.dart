import 'package:ex_booking/constants/app_colors.dart';
import 'package:ex_booking/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorInfoView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(top: 5,bottom: 5),
              child: Icon(Icons.info_outline),
            ),

            /// Selected seat color
            ColorText(text: TextStrings.selected, color: AppColors.selected),

            /// booked seats color
            ColorText(text: TextStrings.reserved, color: AppColors.reserved),

            /// available seats color
            ColorText(text: TextStrings.available, color: AppColors.available),

            /// not available seats color
            ColorText(text: TextStrings.notAvailable, color: AppColors.notAvailable),
          ],
        ),
      ),
    );
  }
}

class ColorText extends GetView {
  final String text;
  final Color color;

  ColorText({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 10,
            width: 10,
            color: color,
          ),
          Text(text)
        ],
      ),
    );
  }
}
