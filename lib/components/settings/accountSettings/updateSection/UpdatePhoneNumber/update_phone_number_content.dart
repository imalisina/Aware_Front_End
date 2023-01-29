import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX packages
import 'package:get/get.dart';
import 'package:sample/controllers/settings/updatePhoneNumber/update_phone_number_controller.dart';

// Other packages
import 'package:sample/configs/theme.dart';
import 'package:sample/configs/route_names.dart';
import 'package:sample/packages/flush_bar_method.dart';
import 'package:sample/packages/space_box_container.dart';

class UpdatePhoneNumberContent extends StatelessWidget {
  const UpdatePhoneNumberContent({super.key});

  // Define update phone number controller
  static final updatePhoneNumberController =
      Get.put(UpdatePhoneNumberController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30.w, right: 30.w),
      child: Column(
        children: [
          // Current phone number read-only input field
          SizedBox(
            height: 55.h,
            child: Obx(
              () => CupertinoTextField(
                placeholder:
                    "Current phone number : ${updatePhoneNumberController.currentPhoneNumber}",
                placeholderStyle: inputActiveDataPlaceholderStyle,
                readOnly: true,
              ),
            ),
          ),

          VerticalSpaceBox(20.h),

          // New phone number input field
          SizedBox(
            height: 55.h,
            child: CupertinoTextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                updatePhoneNumberController.storePhoneNumber(value);
              },
              placeholder: "Enter a new phone number",
              prefix: Obx(
                () => updatePhoneNumberController.phoneNumberHasError.value
                    ? Container(
                        margin: EdgeInsets.only(left: 10.w),
                        child: const Icon(
                          CupertinoIcons.clear_thick_circled,
                          color: ERROR_COLOR,
                        ),
                      )
                    : const EmptyBox(),
              ),
              textInputAction: TextInputAction.done,
              placeholderStyle: inputPlaceholderStyle,
            ),
          ),

          // New phone number error handler widget
          Obx(
            () => updatePhoneNumberController.phoneNumberHasError.value
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 6.h),
                        child: Text(
                          "New email is not valid !",
                          style: TextStyle(
                              color: ERROR_COLOR,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  )
                : const EmptyBox(),
          ),

          VerticalSpaceBox(20.h),

          // Get code button
          SizedBox(
            width: double.maxFinite,
            child: Obx(
              () => CupertinoButton.filled(
                child: updatePhoneNumberController.spinnerStatus.value
                    ? const CupertinoActivityIndicator(
                        color: BACKGROUND_COLOR,
                      )
                    : const Text("Get code"),
                onPressed: () {
                  // Perform validation process
                  updatePhoneNumberController.validatePhoneNumber();
                  // Open redirection gateway
                  updatePhoneNumberController.setAuthorized();

                  // Redirect to verification code screen
                  if (updatePhoneNumberController.hasPermission.isTrue) {
                    // Toggle method to display spinner during API calls
                    updatePhoneNumberController.toggleLoading();
                    Timer(
                      const Duration(seconds: 1),
                      () {
                        // Redirection route
                        Get.toNamed(verifyNewPhoneNumber);
                        updatePhoneNumberController.toggleLoading();
                        showSnackBar(context,
                            "A verification code has been sent to your current phone number !");
                      },
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
