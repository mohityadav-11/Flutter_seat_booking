import 'package:ex_booking/models/exam.dart';
import 'package:ex_booking/screens/aspirant_details/controllers/asp_detail_controller.dart';
import 'package:get/get.dart';

class AspBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AspDetailController(exam: Get.arguments["exam"] as Exam));
  }

}