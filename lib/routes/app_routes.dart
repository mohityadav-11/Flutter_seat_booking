import 'package:ex_booking/screens/aspirant_details/aspirant_details_screen.dart';
import 'package:ex_booking/screens/aspirant_details/bindings/Asp_binding.dart';
import 'package:ex_booking/screens/home/bindings/home_binding.dart';
import 'package:ex_booking/screens/seats/bindings/select_seat_binding.dart';
import 'package:ex_booking/screens/seats/select_seat_screen.dart';
import 'package:get/get.dart';

import '../screens/home/home_screen.dart';
import 'app_route_names.dart';


class AppRoutes{
  static final routes = [
    /// initial route
    GetPage(
      name: AppRouteNames.INITIAL,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),

    /// Aspirant route
    GetPage(
      name: AppRouteNames.ASPIRANT_DETAILS,
      page: () => AspirantDetailsScreen(),
      binding: AspBinding(),
    ),

    /// select seat route
    GetPage(
      name: AppRouteNames.SELECT_SEAT,
      page: () => SelectSeatScreen(),
      binding: SelectSeatBinding(),
    ),


  ];
}