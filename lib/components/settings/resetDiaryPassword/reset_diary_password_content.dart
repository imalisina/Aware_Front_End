import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX packages
import 'package:get/get.dart';
import 'package:sample/controllers/auth/password_field_controller.dart';
import 'package:sample/controllers/settings/diarySettings/diary_password_controller.dart';

// Other packages
import 'package:sample/configs/theme.dart';
import 'package:sample/packages/flush_bar_method.dart';
import 'package:sample/packages/space_box_container.dart';

class ResetDiaryPasswordContent extends StatelessWidget {
  const ResetDiaryPasswordContent({super.key});

  // Define diary password controller
  static final diaryPasswordController = Get.put(DiaryPasswordController());

  // Define password visibility controller
  static final passwordController = Get.put(PasswordFieldController());

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
                  diaryPasswordController.storeNewPassword(value);
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
                  () => diaryPasswordController.newPassHasError.value
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
            () => diaryPasswordController.newPassHasError.value
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
                  diaryPasswordController.storeNewPasswordConfirmation(value);
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
                      diaryPasswordController.newPassConfirmationHasError.value
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
            () => diaryPasswordController.newPassConfirmationHasError.value
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
                child: diaryPasswordController.spinnerStatus.value
                    ? const CupertinoActivityIndicator(
                        color: BACKGROUND_COLOR,
                      )
                    : const Text("Update"),
                onPressed: () {
                  // Perform validation process
                  diaryPasswordController.validatePassword();
                  diaryPasswordController.validatePasswordConfirmation();
                  // Open redirection gateway
                  diaryPasswordController.setAuthorized();

                  // Redirect to a previous page
                  if (diaryPasswordController.hasPermission.isTrue) {
                    // Toggle method to display spinner during API calls
                    diaryPasswordController.toggleLoading();
                    Timer(
                      const Duration(seconds: 3),
                      () {
                        // Redirection route
                        Get.back();
                        diaryPasswordController.toggleLoading();
                        showSnackBar(context,
                            "Diary password has been changed successfully !");
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
