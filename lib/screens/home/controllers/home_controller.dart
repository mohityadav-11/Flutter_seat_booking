import 'package:ex_booking/models/exam.dart';
import 'package:ex_booking/services/api_services.dart';
import 'package:ex_booking/theme/theme_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../models/aspirant.dart';
import '../../../routes/app_route_names.dart';

class HomeController extends GetxController{

  /// reactive variable for exam
  Rxn<Exam> _exam = new Rxn<Exam>();

  /// local database instance
  var _aspirantContainer = GetStorage("aspirants");

  /// aspirants list instance
  RxList<Aspirant> aspirantsList = new RxList<Aspirant>([]);

  /// reactive variable for showing loading
  RxBool loading = new RxBool(true);

  /// getter method for exam
  Exam? get exam => _exam.value;

  /// for theme change
  RxBool _isDark = new RxBool(Get.isDarkMode);
  bool get isDark => _isDark.value;


  @override
  void onInit() async {
    /// fetching data from the api
    _exam.value = await ApiServices.fetchData();

    /// fetching list from data base and adding all to the aspirant list variable
    aspirantsList.addAll(aspirantFromJson(_aspirantContainer.getValues()));

    /// setting loading variable to false
    loading.value = false;
    super.onInit();
  }

  /// switch them
  toggleTheme(value){
    ThemeService().switchTheme();
    _isDark.value = Get.isDarkMode;
  }

  /// go to aspirant details screen
  gotoAspDetails() => Get.toNamed(AppRouteNames.ASPIRANT_DETAILS,arguments: {
    "exam": exam
  });

}