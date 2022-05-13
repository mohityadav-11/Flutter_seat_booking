import 'package:ex_booking/helper/error_snack_bar.dart';
import 'package:ex_booking/models/aspirant.dart';
import 'package:ex_booking/models/exam.dart';
import 'package:ex_booking/routes/app_route_names.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AspDetailController extends GetxController {
  /// exam variable getting from calling screen
  final Exam exam;

  AspDetailController({required this.exam});

  /// reactive variable for name
  RxString _name = new RxString('');

  /// reactive variable for gender
  RxString _gender = new RxString(Gender.type[0]);

  /// reactive variable for age
  RxString _age = new RxString('');

  /// getter method for name
  String get name => _name.value;

  /// getter method for gender
  String get gender => _gender.value;

  /// getter method for age
  String get age => _age.value;

  /// getter method for getting the deadline
  String get deadline =>
      (DateTime.parse(exam.examDate).day - 1).toString() +
      "/" +
      DateTime.parse(exam.examDate).month.toString() +
      "/" +
      DateTime.parse(exam.examDate).year.toString();

  /// reactive variable for enabling and disabling the button
  late RxBool buttonEnabled = new RxBool(false);

  @override
  void onInit() {
    super.onInit();
  }

  /// on change method for name
  onNameChange(String value) {
    _name.value = value;
    updateButton();
  }


  /// on change method for age
  onAgeChange(String value) {
    _age.value = value;
    updateButton();
  }

  /// on change method for gender
  onGenderChange(String? value) {
    _gender.value = value ?? Gender.type[0];
    updateButton();
  }

  /// updating the button variable
  updateButton() {
    buttonEnabled.value =
        name.isNotEmpty && age.isNotEmpty && gender != Gender.type[0];
  }

  /// button on click method
  onClick() {

    /// checking for age validation
    if (int.parse(age) > 99) {
      /// if age not valid showing the error snack bar
      errorSnackBar("Please enter a valid age.");
    } else {
      /// create aspirant variable and assigning the details
      Aspirant _aspirant = new Aspirant(
        name: name,
        age: int.parse(age),
        gender: gender,
        examId: exam.id,
      );

      /// moving to the select seat screen and passing the aspirant variable to it
      /// and list of already existing aspirants on the local database
      Get.toNamed(AppRouteNames.SELECT_SEAT, arguments: {
        "asp": _aspirant,
        "list": aspirantFromJson(GetStorage("aspirants").getValues()),
      });
    }
  }

}
