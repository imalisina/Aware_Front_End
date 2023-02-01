import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  static final locationSettingsController =
      Get.put(LocationSettingsController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      child: Obx(
        () => CupertinoButton.filled(
          padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
          borderRadius: BorderRadius.circular(40.r),
          child: locationSettingsController.spinnerStatus.value
              ? const CupertinoActivityIndicator(
                  color: BACKGROUND_COLOR,
                )
              : Icon(
                  Icons.check_rounded,
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
            if (locationSettingsController.isUpdatable.isTrue) {
              // Togge method to display spinner during API calls
              showSnackBar(
                  context, "Location details has been edited successfully !");
            }
          },
        ),
      ),
    );
  }
}
