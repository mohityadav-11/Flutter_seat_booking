import 'package:get/get.dart';
import 'package:flutter/material.dart';

class TextView extends GetView{

  final String text;

  TextView({required this.text});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(4.0),
      child: Text(text),
    );
  }

}