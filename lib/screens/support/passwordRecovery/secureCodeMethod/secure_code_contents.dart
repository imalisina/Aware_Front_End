import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX package
import 'package:get/get.dart';
import 'package:sample/controllers/passwordRecovery/secure_code_controller.dart';

// Other packages
import 'package:sample/configs/theme.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/screens/support/passwordRecovery/resetPassword/reset_password_screen.dart';

class SecureCodeContents extends StatelessWidget {
  const SecureCodeContents({super.key});

  // Secure Code controller
  static final secureCodeController = Get.put(SecureCodeController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30.w, right: 30.w),
      child: Column(
        children: [
          // Email input field
          SizedBox(
            height: 55.h,
            child: CupertinoTextField(
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                secureCodeController.storeEmail(value);
              },
              placeholder: "Enter your email",
              prefix: Obx(() => secureCodeController.emailHasError.value
                  ? Container(
                      margin: EdgeInsets.only(left: 10.w),
                      child: const Icon(
                        CupertinoIcons.clear_thick_circled,
                        color: ERROR_COLOR,
                      ),
                    )
                  : const EmptyBox()),
              textInputAction: TextInputAction.next,
              placeholderStyle: inputPlaceholderStyle,
            ),
          ),

          // Email error handler widget
          Obx(
            () => secureCodeController.emailHasError.value
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 6.h),
                        child: Text(
                          "Enter a valid email !",
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

          // Secure code input field
          SizedBox(
            height: 55.h,
            child: CupertinoTextField(
              keyboardType: TextInputType.text,
              onChanged: (value) {
                secureCodeController.storeSecureCode(value);
              },
              placeholder: "Enter your Secure Code",
              prefix: Obx(() => secureCodeController.secureCodeHasError.value
                  ? Container(
                      margin: EdgeInsets.only(left: 10.w),
                      child: const Icon(
                        CupertinoIcons.clear_thick_circled,
                        color: ERROR_COLOR,
                      ),
                    )
                  : const EmptyBox()),
              textInputAction: TextInputAction.done,
              placeholderStyle: inputPlaceholderStyle,
            ),
          ),

          // Secure Code error handler widget
          Obx(
            () => secureCodeController.secureCodeHasError.value
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 6.h),
                        child: Text(
                          "Secure code does not match !",
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

          // Verify button
          SizedBox(
            width: double.maxFinite,
            child: Obx(
              () => CupertinoButton.filled(
                child: secureCodeController.spinnerStatus.value
                    ? const CupertinoActivityIndicator(
                        color: BACKGROUND_COLOR,
                      )
                    : const Text("Verify"),
                onPressed: () {
                  // Perform validation process
                  secureCodeController.validateEmail();
                  secureCodeController.validateSecureCode();
                  // Open redirection gateway
                  secureCodeController.setAuthorized();

                  // Redirect to reset password screen
                  if (secureCodeController.hasPermission.isTrue) {
                    // Toggle method to display spinner during API calls
                    secureCodeController.toggleLoading();
                    Timer(
                      const Duration(seconds: 3),
                      () {
                        // Redirection route
                        Get.off(const ResetPasswordScreen());
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
