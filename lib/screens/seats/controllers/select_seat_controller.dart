import 'package:ex_booking/constants/app_colors.dart';
import 'package:ex_booking/models/aspirant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../helper/show_dialog.dart';
import '../../../routes/app_route_names.dart';

class SelectSeatController extends GetxController {
  /// aspirants list variable
  late List<Aspirant> _aspirantsList;

  /// local database instance
  var _aspirantDatabase = GetStorage("aspirants");

  /// current aspirant variable
  Rx<Aspirant> _aspirant = new Rx<Aspirant>(new Aspirant());

  /// getter method for current aspirant
  Aspirant get aspirant => _aspirant.value;

  /// reactive variable for selected seat
  RxString seat = new RxString('');

  /// getter method for selected seat
  String get selectedSeat => seat.value;

  @override
  void onInit() {
    /// assigning the values we got from previous screen
    _aspirant.value = Get.arguments["asp"] as Aspirant;
    _aspirantsList = Get.arguments["list"] as List<Aspirant>;
    super.onInit();
  }

  /// returning color for seat based on conditions
  Color getColor({
    required int row,
    required String col,
  }) {
    /// returning the reserved color if the seat is already booked by other aspirant color
    if (_aspirantsList.any((element) => element.seat == col + row.toString()))
      return AppColors.reserved;

    /// returning the not available color seats based on the inputs
    /// returning not available if
    /// if row is equal to any of the below mentioned
    /// and age <= 20 and
    else if (((row == 1 || row == 6 || row == 3 || row == 4) &&
            aspirant.age <= 20 &&
            aspirant.gender == Gender.type[2]) ||

        /// If the user’s age is <=20 then they can’t select column 1 and column 6
        ((row == 1 || row == 6) &&
            aspirant.age <= 20 &&
            aspirant.gender == Gender.type[1]) ||

        ///If the user’s gender is female, they can’t select aisle seats
        (aspirant.age > 20 &&
            aspirant.age < 30 &&
            aspirant.gender == Gender.type[2] &&
            (row == 3 || row == 4)) ||

        ///If the user’s gender is female, they can’t select aisle seats
        (aspirant.age >= 30 &&
            aspirant.gender == Gender.type[2] &&
            (row == 3 || row == 4)) ||

        ///If the user’s age is >=30 then they can’t select last 6 rows (H,I,J,K,L,M)
        ///If the user’s gender is female, they can’t select aisle seats

        (aspirant.age >= 30 &&
            col.codeUnits[0] >= 72 &&
            aspirant.gender == Gender.type[2] &&
            (row == 3 || row == 4)) ||

        ///If the user’s age is >=30 then they can’t select last 6 rows (H,I,J,K,L,M)
        (aspirant.age >= 30 && col.codeUnits[0] >= 72))
      return AppColors.notAvailable;

    /// else return available color
    else
      return AppColors.available;
  }

  /// this method using sage logic as above method
  /// here we are returning true or false based conditions
  bool seatEnabled({
    required int row,
    required String col,
  }) {
    if (_aspirantsList.any((element) => element.seat == col + row.toString()))
      return false;
    else if (((row == 1 || row == 6 || row == 3 || row == 4) &&
            aspirant.age <= 20 &&
            aspirant.gender == Gender.type[2]) ||
        ((row == 1 || row == 6) &&
            aspirant.age <= 20 &&
            aspirant.gender == Gender.type[1]) ||
        (aspirant.age > 20 &&
            aspirant.age < 30 &&
            aspirant.gender == Gender.type[2] &&
            (row == 3 || row == 4)) ||
        (aspirant.age >= 30 &&
            aspirant.gender == Gender.type[2] &&
            (row == 3 || row == 4)) ||
        (aspirant.age >= 30 &&
            col.codeUnits[0] >= 72 &&
            aspirant.gender == Gender.type[2] &&
            (row == 3 || row == 4)) ||
        (aspirant.age >= 30 && col.codeUnits[0] >= 72))
      return false;
    else
      return true;
  }

  /// on tab select the seat
  void selectSeat(String _seat) => seat.value = _seat;

  /// save the aspirant to the local database
  saveAspirantDetails() async {
    showLoading();
    await Future.delayed(Duration(milliseconds: 600));
    var dd = List<String>.from(_aspirantDatabase.getKeys()).length;
    aspirant.seat = selectedSeat;
    _aspirantDatabase.write("key_${dd}", aspirant.toJson());
    await _aspirantDatabase.save();
    dismissLoading();
    Get.offAllNamed(AppRouteNames.INITIAL);
  }
}
