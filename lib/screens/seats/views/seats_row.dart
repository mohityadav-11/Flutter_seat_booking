import 'package:ex_booking/screens/seats/views/seat.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SeatsRow extends GetView{

  /// variable for column and it's corresponding row list
  final String col;
  final List<int> row;
  SeatsRow({required this.col,required this.row});



  @override
  Widget build(BuildContext context) {

    /// return the row view which will have 3 seats
    return Row(
      children: row.map((ro) => Seat(
        row: ro,
        col: col,
      )).toList(),
    );
  }

}