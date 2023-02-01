import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX packages
import 'package:get/get.dart';
import 'package:sample/app/app_container.dart';
import 'package:sample/configs/route_names.dart';
import 'package:sample/controllers/auth/password_field_controller.dart';
import 'package:sample/controllers/auth/login/login_controller.dart';

// Other packages
import 'package:sample/configs/theme.dart';
import 'package:sample/packages/flush_bar_method.dart';
import 'package:sample/packages/space_box_container.dart';

class LoginContents extends StatelessWidget {
  const LoginContents({super.key});

  // Password controller
  static final passwordController = Get.put(PasswordFieldController());
  // Input fields controller
  static final loginController = Get.put(LoginController());

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
                loginController.storeEmail(value);
              },
              placeholder: "Enter your email",
              prefix: Obx(
                () => loginController.emailHasError.value
                    ? Container(
                        margin: EdgeInsets.only(left: 10.w),
                        child: const Icon(
                          Icons.cancel_rounded,
                          color: ERROR_COLOR,
                        ),
                      )
                    : const EmptyBox(),
              ),
              textInputAction: TextInputAction.next,
              placeholderStyle: inputPlaceholderStyle,
            ),
          ),

          // Email error handler widget
          Obx(
            () => loginController.emailHasError.value
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

          // Password input field
          SizedBox(
            height: 55.h,
            child: Obx(
              () => CupertinoTextField(
                keyboardType: TextInputType.visiblePassword,
                onChanged: (value) {
                  loginController.storePassword(value);
                },
                placeholder: "Enter your password",
                obscureText: passwordController.isPassword.value,
                suffix: passwordController.secureSection
                    ? CupertinoButton(
                        child: Icon(
                          passwordController.isPassword.value
                              ? Icons.visibility_rounded
                              : Icons.visibility_off_rounded,
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
                  () => loginController.passwordHasError.value
                      ? Container(
                          margin: EdgeInsets.only(left: 10.w),
                          child: const Icon(
                            Icons.cancel_rounded,
                            color: ERROR_COLOR,
                          ),
                        )
                      : const EmptyBox(),
                ),
                placeholderStyle: inputPlaceholderStyle,
              ),
            ),
          ),

          // Password error handler widget
          Obx(
            () => loginController.passwordHasError.value
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 6.h),
                        child: Text(
                          "Password does not match !",
                          style: TextStyle(
                              color: ERROR_COLOR,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  )
                : const EmptyBox(),
          ),

          VerticalSpaceBox(20.h),

          // Login button
          SizedBox(
            width: double.maxFinite,
            child: Obx(
              () => CupertinoButton.filled(
                child: loginController.spinnerStatus.value
                    ? const CupertinoActivityIndicator(
                        color: BACKGROUND_COLOR,
                      )
                    : const Text("Login"),
                onPressed: () {
                  // Perform validation process
                  loginController.validateEmail();
                  loginController.validatePassword();
                  // Open redirection gateway
                  loginController.setAuthorized();

                  // Redirect to home screen
                  if (loginController.hasPermission.isTrue) {
                    // Toggle method to display spinner during API calls
                    loginController.toggleLoading();
                    Timer(
                      const Duration(seconds: 3),
                      () {
                        // Redirection route
                        Get.off(const AppContainer());
                        showSnackBar(context, "Logged in !");
                      },
                    );
                  }
                },
              ),
            ),
          ),

          // Register route
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("New to Aware ?",
                    style: TextStyle(color: PRIMARY_COLOR, fontSize: 13.sp)),
                CupertinoButton(
                  padding: const EdgeInsets.all(0),
                  child: Text(
                    " Join now",
                    style: TextStyle(
                      fontSize: 13.sp,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onPressed: () {
                    Get.toNamed(register);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
