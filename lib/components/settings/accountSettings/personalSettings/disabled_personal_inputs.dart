import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX packages
import 'package:get/get.dart';
import 'package:sample/controllers/settings/personalSettings/personal_settings_controller.dart';

// Other packages
import 'package:sample/configs/theme.dart';
import 'package:sample/packages/space_box_container.dart';

class DisabledPersonalInputs extends StatelessWidget {
  const DisabledPersonalInputs({super.key});

  // Define personal settings controller
  static final personalSettingsController =
      Get.put(PersonalSettingsController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          // Full name disabled input
          SizedBox(
            height: 55.h,
            child: CupertinoTextField(
              placeholder: "Name : ${personalSettingsController.name}",
              placeholderStyle: inputActiveDataPlaceholderStyle,
              readOnly: true,
            ),
          ),

          VerticalSpaceBox(20.h),

          // Birthdate disabled input
          SizedBox(
            height: 55.h,
            child: CupertinoTextField(
              placeholder:
                  "Birthdate : ${personalSettingsController.birthDay} / ${personalSettingsController.birthMonth} / ${personalSettingsController.birthYear}",
              placeholderStyle: inputActiveDataPlaceholderStyle,
              readOnly: true,
            ),
          ),

          VerticalSpaceBox(20.h),

          // Gender disabled input
          SizedBox(
            height: 55.h,
            child: CupertinoTextField(
              placeholder: "Gender : ${personalSettingsController.genderName}",
              placeholderStyle: inputActiveDataPlaceholderStyle,
              readOnly: true,
            ),
          ),

          VerticalSpaceBox(20.h),

          // Ethnicity disabled input
          SizedBox(
            height: 55.h,
            child: CupertinoTextField(
              placeholder:
                  "Ethnicity : ${personalSettingsController.ethnicityName}",
              placeholderStyle: inputActiveDataPlaceholderStyle,
              readOnly: true,
            ),
          ),

          VerticalSpaceBox(20.h),

          // Favourite fashion style disabled input
          SizedBox(
            height: 55.h,
            child: CupertinoTextField(
              placeholder:
                  "Favourite fashion style : ${personalSettingsController.fashionStyleName}",
              placeholderStyle: inputActiveDataPlaceholderStyle,
              readOnly: true,
            ),
          ),

          VerticalSpaceBox(20.h),

          // Weight disabled input
          SizedBox(
            height: 55.h,
            child: CupertinoTextField(
              placeholder: "Weight : ${personalSettingsController.weight}",
              placeholderStyle: inputActiveDataPlaceholderStyle,
              readOnly: true,
            ),
          ),

          VerticalSpaceBox(20.h),

          // Height disabled input
          SizedBox(
            height: 55.h,
            child: CupertinoTextField(
              placeholder: "Height : ${personalSettingsController.height}",
              placeholderStyle: inputActiveDataPlaceholderStyle,
              readOnly: true,
            ),
          ),
        ],
      ),
    );
  }
}
