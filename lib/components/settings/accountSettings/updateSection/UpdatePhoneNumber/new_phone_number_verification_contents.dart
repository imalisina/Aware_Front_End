import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX packages
import 'package:get/get.dart';
import 'package:sample/controllers/settings/updatePhoneNumber/new_phone_number_verification_controller.dart';
import 'package:sample/controllers/settings/updatePhoneNumber/update_phone_number_controller.dart';

// Other packages
import 'package:sample/configs/theme.dart';
import 'package:sample/app/app_container.dart';
import 'package:sample/packages/flush_bar_method.dart';
import 'package:sample/packages/space_box_container.dart';

class NewPhoneNumberVerificationContents extends StatelessWidget {
  const NewPhoneNumberVerificationContents({super.key});

  // Define new phone number verification controller
  static final newPhoneNumberVerificationController =
      Get.put(NewPhoneNumberVerificationController());

  // Define update phone number controller
  static final updatePhoneNumberController =
      Get.put(UpdatePhoneNumberController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30.w, right: 30.w),
      child: Column(
        children: [
          // Verification input field
          SizedBox(
            height: 55.h,
            child: CupertinoTextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                newPhoneNumberVerificationController
                    .storeVerificationCode(value);
              },
              placeholder: "Enter the verification code",
              prefix: Obx(() => newPhoneNumberVerificationController
                      .verificationCodeHasError.value
                  ? Container(
                      margin: EdgeInsets.only(left: 10.w),
                      child: const Icon(
                        Icons.cancel_rounded,
                        color: ERROR_COLOR,
                      ),
                    )
                  : const EmptyBox()),
              textInputAction: TextInputAction.done,
              placeholderStyle: inputPlaceholderStyle,
            ),
          ),

          // Verification code erro handler widget
          Obx(
            () => newPhoneNumberVerificationController
                    .verificationCodeHasError.value
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 6.h),
                        child: Text(
                          "Invalid verification code !",
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

          // Verify
          SizedBox(
            width: double.maxFinite,
            child: Obx(
              () => CupertinoButton.filled(
                child: newPhoneNumberVerificationController.spinnerStatus.value
                    ? const CupertinoActivityIndicator(
                        color: BACKGROUND_COLOR,
                      )
                    : const Text("Verify"),
                onPressed: () {
                  // Perform validation process
                  newPhoneNumberVerificationController
                      .validateVerificationCode();
                  // Open redirection gateway
                  newPhoneNumberVerificationController.setAuthorized();

                  // Redirect to reset password screen
                  if (newPhoneNumberVerificationController
                      .hasPermission.isTrue) {
                    // Toggle method to display spinner during API calls
                    newPhoneNumberVerificationController.toggleLoading();
                    updatePhoneNumberController.updatePhoneNumber();
                    Timer(
                      const Duration(seconds: 3),
                      () {
                        // Redirection route
                        Get.off(const AppContainer());
                        showSnackBar(context,
                            "Phone number has been updated successfully !");
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
