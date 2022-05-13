import 'package:ex_booking/constants/text_strings.dart';
import 'package:ex_booking/helper/show_dialog.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectSeatAppBar extends GetView{
  @override
  Widget build(BuildContext context) {

    return Container(
      height: 50,
      child: Stack(
        children: [

          /// back button
          BackButton(
            onPressed: () => Get.back(),
          ),

          /// title view
          Align(
            alignment: Alignment.center,
            child: Text(
              TextStrings.selectSeat,
              style: GoogleFonts.specialElite(fontSize: 18),
            ),
          ),

          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: Icon(Icons.info_outline),
              onPressed: showInfoDialog,
            ),
          ),

        ],
      ),
    );
  }

}