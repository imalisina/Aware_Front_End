import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX package
import 'package:get/get.dart';
import 'package:sample/controllers/auth/password_field_controller.dart';
import 'package:sample/controllers/passwordRecovery/reset_password_controller.dart';

// Other packages
import 'package:sample/configs/theme.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/screens/auth/login/login_screen.dart';

class ResetPasswordContents extends StatelessWidget {
  const ResetPasswordContents({super.key});

  // Define reset password controller
  static final resetPasswordController = Get.put(ResetPasswordController());
  // Define password visibility controller
  static final passwordController = Get.put(PasswordFiledController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30.w, right: 30.w),
      child: Column(
        children: [
          // New password input field
          SizedBox(
            height: 55.h,
            child: Obx(
              () => CupertinoTextField(
                keyboardType: TextInputType.visiblePassword,
                onChanged: (value) {
                  resetPasswordController.storeNewPassword(value);
                },
                placeholder: "Enter your new password",
                obscureText: passwordController.isPassword.value,
                suffix: passwordController.secureSection
                    ? CupertinoButton(
                        child: Icon(
                          passwordController.isPassword.value
                              ? CupertinoIcons.eye
                              : CupertinoIcons.eye_slash,
                          color: SECONDARY_COLOR,
                          size: 21.sp,
                        ),
                        onPressed: () {
                          // Toggles between show/hide password text
                          passwordController.togglePassword();
                        },
                      )
                    : const EmptyBox(),
                textInputAction: TextInputAction.next,
                prefix: Obx(
                  () => resetPasswordController.newPassHasError.value
                      ? Container(
                          margin: EdgeInsets.only(left: 10.w),
                          child: const Icon(
                            CupertinoIcons.clear_thick_circled,
                            color: ERROR_COLOR,
                          ),
                        )
                      : const EmptyBox(),
                ),
                placeholderStyle: inputPlaceholderStyle,
              ),
            ),
          ),

          // New password error handler widget
          Obx(
            () => resetPasswordController.newPassHasError.value
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 6.h),
                        child: Text(
                          "Enter a secure password !",
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

          // Passowrd confirmation input field
          SizedBox(
            height: 55.h,
            child: Obx(
              () => CupertinoTextField(
                keyboardType: TextInputType.visiblePassword,
                onChanged: (value) {
                  resetPasswordController.storeNewPasswordConfirmation(value);
                },
                placeholder: "Enter the new password again",
                obscureText: passwordController.isPassword.value,
                suffix: passwordController.secureSection
                    ? CupertinoButton(
                        child: Icon(
                          passwordController.isPassword.value
                              ? CupertinoIcons.eye
                              : CupertinoIcons.eye_slash,
                          color: SECONDARY_COLOR,
                          size: 21.sp,
                        ),
                        onPressed: () {
                          // Toggles between show/hide password text
                          passwordController.togglePassword();
                        },
                      )
                    : const EmptyBox(),
                prefix: Obx(
                  () =>
                      resetPasswordController.newPassConfirmationHasError.value
                          ? Container(
                              margin: EdgeInsets.only(left: 10.w),
                              child: const Icon(
                                CupertinoIcons.clear_thick_circled,
                                color: ERROR_COLOR,
                              ),
                            )
                          : const EmptyBox(),
                ),
                placeholderStyle: inputPlaceholderStyle,
              ),
            ),
          ),

          // Password confirmation error handler widget
          Obx(
            () => resetPasswordController.newPassConfirmationHasError.value
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 6.h),
                        child: Text(
                          "Passwords do not match !",
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

          // Update password button
          SizedBox(
            width: double.maxFinite,
            child: Obx(
              () => CupertinoButton.filled(
                child: resetPasswordController.spinnerStatus.value
                    ? const CupertinoActivityIndicator(
                        color: BACKGROUND_COLOR,
                      )
                    : const Text("Update"),
                onPressed: () {
                  // Perform validation process
                  resetPasswordController.validatePassword();
                  resetPasswordController.validatePasswordConfirmation();
                  // Open redirection gateway
                  resetPasswordController.setAuthorized();

                  // Redirect to success page
                  if (resetPasswordController.hasPermission.isTrue) {
                    // Toggle method to display spinner during API calls
                    resetPasswordController.toggleLoading();
                    Timer(
                      const Duration(seconds: 3),
                      () {
                        // Redirection route
                        Get.off(const LoginPage());
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
