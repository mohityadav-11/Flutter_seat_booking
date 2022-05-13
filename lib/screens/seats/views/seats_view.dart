import 'package:ex_booking/screens/seats/views/seats_row.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../constants/lists.dart';

class SeatsView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        /// column for left size seats view
        Column(
          children: column_list
              .map<Widget>((col) => SeatsRow(
                    col: col,
                    row: left_row_list,
                  ))
              .toList(),
        ),

        /// column for right side seats view
        Column(
          children: column_list
              .map<Widget>((col) => SeatsRow(
                    col: col,
                    row: right_row_list,
                  ))
              .toList(),
        )
      ],
    );
  }
}
