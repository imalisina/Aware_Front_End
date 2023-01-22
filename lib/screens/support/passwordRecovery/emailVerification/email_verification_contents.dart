import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX package
import 'package:get/get.dart';
import 'package:sample/controllers/passwordRecovery/email_verification_controller.dart';

// Other packages
import 'package:sample/configs/color_palette.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/screens/support/passwordRecovery/resetPassword/reset_password_screen.dart';

class EmailVerificationContents extends StatelessWidget {
  const EmailVerificationContents({super.key});

  // Email verification controller
  static final verificationController = Get.put(EmailVerificationController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30.w, right: 30.w),
      child: Column(
        children: [
          // Verification input field
          SizedBox(
            height: 55.h,
            child: CupertinoTextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                verificationController.storeVerificationCode(value);
              },
              placeholder: "Enter the verification code",
              prefix: Obx(
                  () => verificationController.verificationCodeHasError.value
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

          // Verification code erro handler widget
          Obx(
            () => verificationController.verificationCodeHasError.value
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
                child: verificationController.spinnerStatus.value
                    ? const CupertinoActivityIndicator(
                        color: BACKGROUND_COLOR,
                      )
                    : const Text("Verify"),
                onPressed: () {
                  // Perform validation process
                  verificationController.validateVerificationCode();
                  // Open redirection gateway
                  verificationController.setAuthorized();

                  // Redirect to reset password screen
                  if (verificationController.hasPermission.isTrue) {
                    // Toggle method to display spinner during API calls
                    verificationController.toggleLoading();
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
