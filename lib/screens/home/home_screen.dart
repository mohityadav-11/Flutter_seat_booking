import 'package:ex_booking/screens/home/controllers/home_controller.dart';
import 'package:ex_booking/screens/home/views/app_bar_view.dart';
import 'package:ex_booking/screens/home/views/aspirant_card_view.dart';
import 'package:ex_booking/screens/home/views/exam_details_card_view.dart';
import 'package:ex_booking/screens/home/views/no_user.dart';
import 'package:ex_booking/screens/seats/views/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController _controller = Get.find<HomeController>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ///App bar
            AppBarView(),

            /// card view for exam details
            ExamDetailsCardView(),

            /// obx for listing the controller changes
            Obx(() {
              return _controller.loading.value

                  /// show loading while data is getting fetched
                  ? Expanded(child: Loading())
                  : _controller.aspirantsList.length == 0

                      /// if no user is available in database show no user registered view
                      ? NoUser()

                      /// if users are available show users list
                      : Expanded(
                          child: ListView(
                            children: _controller.aspirantsList.map((aspirant) {
                              return AspirantCardView(aspirant: aspirant);
                            }).toList(),
                          ),
                        );
            }),
          ],
        ),
      ),
    );
  }
}
