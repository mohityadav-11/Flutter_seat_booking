import 'package:ex_booking/models/aspirant.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AspirantCardView extends GetView{

  final Aspirant aspirant;

  AspirantCardView({required this.aspirant});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Card(
        elevation: 10,
        color: Colors.green,
        child: Container(
          padding: EdgeInsets.all(12.0),
          child: Row(
            children: [

              /// expanded text view for aspirant name
              Expanded(
                child: Text(
                  aspirant.name,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16),
                ),
              ),

              ///showing the registered seat no in the ending
              Text(
                "Seat No: " + aspirant.seat,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }

}