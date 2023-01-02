import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX packages
import 'package:get/get.dart';
import 'package:sample/screens/Auth/password_field_controller.dart';
import 'package:sample/screens/Auth/LoginPage/login_controller.dart';

// Other packages
import 'package:sample/constants/constants.dart';
import 'package:sample/screens/HomePage/home_screen.dart';
import 'package:sample/utils/space_box_container.dart';

class LoginContents extends StatelessWidget {
  const LoginContents({super.key});

  // Password controller
  static final passwordController = Get.put(PasswordFiledController());
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
              onChanged: (value) {
                loginController.storeEmail(value);
              },
              placeholder: "Enter your email",
              prefix: Obx(() => loginController.emailHasError.value
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
          Obx(() => loginController.emailHasError.value
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
                    )
                  ],
                )
              : const EmptyBox()),

          VerticalSpaceBox(20.h),

          // Password input field
          SizedBox(
            height: 55.h,
            child: Obx(
              () => CupertinoTextField(
                onChanged: (value) {
                  loginController.storePassword(value);
                },
                placeholder: "Enter your password",
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
                prefix: Obx(() => loginController.passwordHasError.value
                    ? Container(
                        margin: EdgeInsets.only(left: 10.w),
                        child: const Icon(
                          CupertinoIcons.clear_thick_circled,
                          color: ERROR_COLOR,
                        ),
                      )
                    : const EmptyBox()),
                placeholderStyle: inputPlaceholderStyle,
              ),
            ),
          ),

          // Password error handler widget
          Obx(() => loginController.passwordHasError.value
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
              : const EmptyBox()),

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
                        loginController.toggleLoading();

                        // Redirection route
                        // ignore: prefer_const_constructors
                        Get.off(HomeScreen());
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
                    Get.toNamed("/auth/register");
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
