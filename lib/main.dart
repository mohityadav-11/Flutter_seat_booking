import 'package:ex_booking/routes/app_route_names.dart';
import 'package:ex_booking/routes/app_routes.dart';
import 'package:ex_booking/theme/theme_service.dart';
import 'package:ex_booking/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';


/// main class or starting class
Future<void> main() async {
  await GetStorage.init();
  runApp(ParentClass());
}

/// Parent class of this project
class ParentClass extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
      //initialBinding: HomeBinding(),
      title: "Exam Seat Booking",
      initialRoute: AppRouteNames.INITIAL,
      getPages: AppRoutes.routes,
    );
  }
}
