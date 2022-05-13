import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/text_strings.dart';
import '../../../models/aspirant.dart';
import '../../../theme/themes.dart';
import '../controllers/asp_detail_controller.dart';

class GetDetailsView extends GetView {
  @override
  Widget build(BuildContext context) {
    /// controller instance
    final AspDetailController _controller = Get.find<AspDetailController>();

    return Column(
      children: [
        /// full name input view
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            onChanged: _controller.onNameChange,
            decoration: InputDecoration(
              fillColor: AppColors.grey,
              hintText: TextStrings.name,
              filled: true,
              focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
              contentPadding: EdgeInsets.all(10),
            ),
          ),
        ),

        /// age and gender input view
        AgeAndGenderInputView(),

        /// select seat button view
        Obx(() {
          return Container(
            padding: EdgeInsets.all(8.0),
            width: double.maxFinite,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Themes.primaryColor,
                  onSurface: Themes.primaryColor),
              onPressed: _controller.buttonEnabled.value
                  ? _controller.onClick
                  : null,
              child: Text(TextStrings.selectSeat),
            ),
          );
        }),

      ],
    );
  }
}

/// age and gender input view
class AgeAndGenderInputView extends GetView {
  @override
  Widget build(BuildContext context) {
    /// controller instance
    final AspDetailController _controller = Get.find<AspDetailController>();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          /// Age input field view
          Flexible(
            child: TextFormField(
              onChanged: _controller.onAgeChange,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                fillColor: AppColors.grey,
                hintText: TextStrings.age,
                filled: true,
                focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
                contentPadding: EdgeInsets.all(10),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),

          /// gender drop down view
          Obx(() {
            return DropdownButton<String>(
              value: _controller.gender,
              icon: Container(
                margin: EdgeInsets.only(left: 5),
                child: Icon(
                  CupertinoIcons.chevron_compact_down,
                  color: Themes.primaryColor,
                ),
              ),
              elevation: 16,
              style: TextStyle(color: Themes.primaryColor),
              underline: Container(
                height: 2,
                color: Themes.primaryColor,
              ),
              onChanged: _controller.onGenderChange,
              items: Gender.type.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            );
          }),
        ],
      ),
    );
  }
}
