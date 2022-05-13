import 'package:ex_booking/screens/seats/views/color_info_view.dart';
import 'package:get/get.dart';

import 'loading_dialog.dart';


/// loading
showLoading(){
  Get.dialog(
    LoadingDialog(text: "Loading"),
    useSafeArea: true,
    barrierDismissible: false,
  );
}

showInfoDialog(){
  Get.dialog(
    ColorInfoView(),
    useSafeArea: true,
    barrierDismissible: true,
  );
}

/// close dialog
dismissLoading(){
  Get.back();
}

