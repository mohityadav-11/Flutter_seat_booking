import 'package:ex_booking/constants/app_colors.dart';
import 'package:ex_booking/constants/text_strings.dart';
import 'package:ex_booking/screens/aspirant_details/controllers/asp_detail_controller.dart';
import 'package:ex_booking/screens/aspirant_details/views/asp_top_bar_view.dart';
import 'package:ex_booking/screens/aspirant_details/views/details_view.dart';
import 'package:ex_booking/screens/aspirant_details/views/get_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'views/divider_view.dart';

class AspirantDetailsScreen extends StatelessWidget {
  /// instance of aspirant details controller
  final AspDetailController _controller = Get.find<AspDetailController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// top view
              AspTopView(
                imageUrl: _controller.exam.image,
                title: _controller.exam.title,
              ),

              /// details part
              DetailsView(
                detail1: _controller.exam.detail1,
                detail2: _controller.exam.detail2,
              ),

              /// deadline view
              Container(
                padding: EdgeInsets.all(8.0),
                child: RichText(
                  text: TextSpan(
                    text: TextStrings.deadline,
                    style: TextStyle(color: AppColors.blackOrWhite),
                    children: <TextSpan>[
                      TextSpan(
                          text: _controller.deadline,
                          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red)),
                    ],
                  ),
                ),
              ),

              /// eligibility text view
              Container(
                padding: EdgeInsets.all(8.0),
                child: Text("Eligibility: " + _controller.exam.eligibility),
              ),

              /// divider with title
              DividerView(),


              /// get details view
              GetDetailsView(),

            ],
          ),
        ),
      ),
    );
  }
}
