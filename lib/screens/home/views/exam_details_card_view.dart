import 'package:ex_booking/constants/text_strings.dart';
import 'package:ex_booking/helper/car_simmer.dart';
import 'package:ex_booking/screens/home/views/card_image_view.dart';
import 'package:ex_booking/screens/home/views/text_view.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../controllers/home_controller.dart';

class ExamDetailsCardView extends GetView {
  /// home controller
  final HomeController _controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Obx(() {
        return _controller.exam == null

            /// if variable is null showing shimmer effect
            ? cardShimmer()

            /// if variable has data thn showing the card view
            : _controller.exam!.examDate.isEmpty

                /// if data is not available at api
                ? Container(
                    child: Text(TextStrings.noExamData),
                  )

                /// if data is available returning the card view
                : Card(
                    /// providing elevation to the card and shape
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),

                    /// using inkWell for click event
                    child: InkWell(
                      /// on click event defined in the controller and border radius
                      onTap: _controller.gotoAspDetails,
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          /// image view
                          CardImageView(imageUrl: _controller.exam!.image),

                          SizedBox(
                            width: 10,
                          ),

                          /// text views
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /// text view for title
                                TextView(text: _controller.exam!.title),

                                /// text view for year
                                TextView(text: _controller.exam!.year),

                                /// text view for detail1
                                TextView(text: _controller.exam!.detail1),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
      }),
    );
  }
}
