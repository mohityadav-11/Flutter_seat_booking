import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../constants/text_strings.dart';

class NoUser extends GetView{
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(8.0),
      alignment: Alignment.center,
      child: Text(
        TextStrings.noUser,
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }

}