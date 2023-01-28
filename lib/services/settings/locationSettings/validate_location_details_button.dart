import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX package
import 'package:get/get.dart';
import 'package:sample/controllers/location/location_controller.dart';

// Other packages
import 'package:sample/configs/theme.dart';

class ValidateLocationDetailsButton extends StatelessWidget {
  const ValidateLocationDetailsButton({super.key});

  // Define location controller
  static final locationController = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      child: Obx(
        () => CupertinoButton.filled(
          padding:
              EdgeInsets.only(left: 40.w, right: 40.w, top: 10.h, bottom: 10.h),
          borderRadius: BorderRadius.circular(40.r),
          child: locationController.spinnerStatus.value
              ? const CupertinoActivityIndicator(
                  color: BACKGROUND_COLOR,
                )
              : Icon(
                  CupertinoIcons.checkmark_alt,
                  size: 30.sp,
                ),
          onPressed: () {
            // Perform validation process
            locationController.validateState();
            locationController.validateZipCode();
            locationController.validateAddress();
            // Open redirection gateway
            locationController.updateLocationDetails();

            // Redirect to profile confirmation screen
            if (locationController.hasPermission.isTrue) {
              // Togge method to display spinner during API calls
              locationController.toggleLoading();
              Timer(
                const Duration(milliseconds: 500),
                () {
                  locationController.toggleLoading();
                },
              );
            }
          },
        ),
      ),
    );
  }
}
