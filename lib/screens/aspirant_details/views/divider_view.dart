import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../constants/text_strings.dart';
import '../../../theme/themes.dart';

class DividerView extends GetView{
  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          /// line
          Container(
            color: Themes.primaryColor,
            height: 1,
            width: Get.width / 3,
          ),
          /// title
          Text(TextStrings.details),
          /// line
          Container(
            color: Themes.primaryColor,
            height: 1,
            width: Get.width / 3,
          ),
        ],
      ),
    );
  }

}