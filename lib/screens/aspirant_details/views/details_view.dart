import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsView extends GetView {

  final String detail1,detail2;

  DetailsView({required this.detail1,required this.detail2});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// details1 text view
          Text(
            detail1,
            style: TextStyle(fontSize: 12),
          ),

          SizedBox(
            height: 3,
          ),

          /// detail2 view
          Text(
            detail2,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

}