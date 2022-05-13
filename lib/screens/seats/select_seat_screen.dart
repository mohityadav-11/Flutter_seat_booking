import 'package:ex_booking/constants/text_strings.dart';
import 'package:ex_booking/screens/seats/views/loading.dart';
import 'package:ex_booking/screens/seats/views/seats_view.dart';
import 'package:ex_booking/screens/seats/views/select_seat_app_bar.dart';
import 'package:ex_booking/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/select_seat_controller.dart';

class SelectSeatScreen extends StatelessWidget {
  SelectSeatScreen({Key? key}) : super(key: key);

  final SelectSeatController _controller = Get.find<SelectSeatController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// custom app bar
              SelectSeatAppBar(),

              /// show loading while fetching the required details
              /// else show seats view
              Obx(() {
                return _controller.aspirant.name.isEmpty

                    /// loading view
                    ? Loading()

                    /// seats view
                    : SeatsView();
              }),
            ],
          ),
        ),
      ),

      /// bottom submit button
      bottomNavigationBar: Obx(() {
        return Container(
          padding: EdgeInsets.all(8.0),
          width: double.maxFinite,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Themes.primaryColor,
              onSurface: Themes.primaryColor,
            ),
            child: Text(TextStrings.submit),
            onPressed: _controller.selectedSeat.isEmpty
                ? null
                : _controller.saveAspirantDetails,
          ),
        );
      }),
    );
  }
}
