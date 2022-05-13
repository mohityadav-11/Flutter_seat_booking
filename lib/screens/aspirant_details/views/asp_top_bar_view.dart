import 'package:cached_network_image/cached_network_image.dart';
import 'package:ex_booking/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AspTopView extends GetView {
  final String imageUrl, title;

  AspTopView({required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.maxFinite,

      /// adding image in the background of container
      decoration: BoxDecoration(
        image: DecorationImage(
            image: CachedNetworkImageProvider(imageUrl), fit: BoxFit.cover),
      ),
      child: Stack(
        children: [
          /// back button view
          BackButton(
            onPressed: () => Get.back(),
          ),

          /// title view
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Text(
                title,
                style: TextStyle(color: AppColors.blackOrWhite, fontSize: 30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
