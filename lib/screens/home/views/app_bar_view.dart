import 'package:ex_booking/screens/home/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:switcher_button/switcher_button.dart';

class AppBarView extends GetView {

  final HomeController _controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Stack(
        children: [

          /// title view
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(
                "Exam Seat Booking",
                style: GoogleFonts.specialElite(fontSize: 18),
              ),
            ),
          ),

          /// theme switch button
          Obx((){
            return Align(
              alignment: Alignment.centerRight,
              child: Container(
                height: 25,
                width: 60,
                margin: EdgeInsets.only(right: 10),
                child: SwitcherButton(
                  value: _controller.isDark,
                  onChange: _controller.toggleTheme,
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
