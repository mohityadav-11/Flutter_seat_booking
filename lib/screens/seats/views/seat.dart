import 'package:ex_booking/screens/seats/controllers/select_seat_controller.dart';
import 'package:ex_booking/theme/themes.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Seat extends GetView {
  /// getting the column and row position
  final String col;
  final int row;

  Seat({
    required this.col,
    required this.row,
  });

  /// select seat controller instance
  final SelectSeatController _controller = Get.find<SelectSeatController>();

  @override
  Widget build(BuildContext context) {
    /// using obx to listen the controller changes
    return Obx(() {
      return Padding(
        padding: EdgeInsets.all(8.0),

        /// ui design of the seat view
        child: Material(
          elevation: 10,
          color: _controller.selectedSeat == col + row.toString()

              /// if the row is selected by current user showing this color
              ? Themes.primaryColor

              /// assigning the color for seat based on condition defined in the controller
              : _controller.getColor(row: row, col: col),
          borderRadius: BorderRadius.all(Radius.circular(5)),
          child: InkWell(
            /// controlling button tap the on tab based on conditions defined in the controller
            onTap: _controller.seatEnabled(row: row, col: col)

                /// if on tap is enabled selecting the seat
                ? () => _controller.selectSeat(col + row.toString())
                : null,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            child: Container(
              alignment: Alignment.center,
              height: 30,
              width: 30,

              /// test view showing the position of the seat
              child: Text(
                col + row.toString(),
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      );
    });
  }
}
