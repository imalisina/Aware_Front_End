import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX packages
import 'package:get/get.dart';
import 'package:sample/controllers/personalSettings/personal_settings_controller.dart';

// Other packages
import 'package:sample/configs/theme.dart';
import 'package:sample/packages/flush_bar_method.dart';

class ValidatePersonalDetailsButton extends StatelessWidget {
  const ValidatePersonalDetailsButton({super.key});

  // Define personal settings controller
  static final personalSettingsController =
      Get.put(PersonalSettingsController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      child: Obx(
        () => CupertinoButton.filled(
          padding:
              EdgeInsets.only(left: 40.w, right: 40.w, top: 10.h, bottom: 10.h),
          borderRadius: BorderRadius.circular(40.r),
          onPressed: () {
            // Perform validation process
            personalSettingsController.validateName();
            personalSettingsController.validateBirthDate();
            personalSettingsController.validateGender();
            // Open redirection gateway
            personalSettingsController.updateLocationDetails();

            // Redirect to profile confirmation screen
            if (personalSettingsController.hasPermission.isTrue) {
              // Togge method to display spinner during API calls
              personalSettingsController.toggleLoading();
              showSnackBar(
                  context, "Personal details has been edited successfully !");
              Timer(
                const Duration(milliseconds: 500),
                () {
                  personalSettingsController.toggleLoading();
                },
              );
            }
          },
          child: personalSettingsController.spinnerStatus.value
              ? const CupertinoActivityIndicator(
                  color: BACKGROUND_COLOR,
                )
              : Icon(
                  CupertinoIcons.checkmark_alt,
                  size: 30.sp,
                ),
        ),
      ),
    );
  }
}