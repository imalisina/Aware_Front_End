import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX package
import 'package:get/get.dart';

// Other packages
import 'package:sample/configs/theme.dart';
import 'package:sample/controllers/settings/locationSettings/location_settings_controller.dart';
import 'package:sample/packages/flush_bar_method.dart';

class ValidateLocationDetailsButton extends StatelessWidget {
  const ValidateLocationDetailsButton({super.key});

// Define location settings controller
  static final locationSettingsController = Get.put(LocationSettingsController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      child: Obx(
        () => CupertinoButton.filled(
          padding:
              EdgeInsets.only(left: 40.w, right: 40.w, top: 10.h, bottom: 10.h),
          borderRadius: BorderRadius.circular(40.r),
          child: locationSettingsController.spinnerStatus.value
              ? const CupertinoActivityIndicator(
                  color: BACKGROUND_COLOR,
                )
              : Icon(
                  CupertinoIcons.checkmark_alt,
                  size: 30.sp,
                ),
          onPressed: () {
            // Perform validation process
            locationSettingsController.validateState();
            locationSettingsController.validateZipCode();
            locationSettingsController.validateAddress();
            // Open redirection gateway
            locationSettingsController.updateLocationDetails();

            // Redirect to profile confirmation screen
            if (locationSettingsController.hasPermission.isTrue) {
              // Togge method to display spinner during API calls
              locationSettingsController.toggleLoading();
              showSnackBar(
                  context, "Location details has been edited successfully !");
              Timer(
                const Duration(milliseconds: 500),
                () {
                  locationSettingsController.toggleLoading();
                },
              );
            }
          },
        ),
      ),
    );
  }
}
