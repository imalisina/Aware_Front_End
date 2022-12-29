import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX packages
import 'package:get/get.dart';

// Other packages
import 'package:sample/constants/constants.dart';
import 'package:sample/screens/Auth/LoginPage/login_controller.dart';
import 'package:sample/screens/Auth/LoginPage/password_field_controller.dart';
import 'package:sample/utils/space_box_container.dart';
import 'package:sample/screens/Auth/bottom_help_menu.dart';

class LoginContents extends StatelessWidget {
  LoginContents({super.key});

  // Password controller
  final passwordController = Get.put(PasswordFiledController());
  final loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginController.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30).w,
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            // Email input field
            SizedBox(
              height: 55.h,
              // ignore: prefer_const_constructors
              child: CupertinoTextField(
                controller: loginController.emailController,
                onSubmitted: (value) {
                  loginController.email = value;
                },
                placeholder: "Enter your email",
                textInputAction: TextInputAction.next,
                placeholderStyle: const TextStyle(
                    color: INPUT_PLACEHOLDER, fontWeight: FontWeight.w300),
              ),
            ),

            VerticalSpaceBox(20.h),

            // Password input field
            SizedBox(
              height: 55.h,
              // ignore: prefer_const_constructors
              child: Obx(
                () => CupertinoTextField(
                  controller: loginController.passwordController,
                  onSubmitted: (value) {
                    loginController.password = value;
                  },
                  placeholder: "Enter yout password",
                  obscureText: passwordController.isPassword.value,
                  suffix: true
                      ? CupertinoButton(
                          child: Icon(
                            passwordController.isPassword.value
                                ? CupertinoIcons.eye
                                : CupertinoIcons.eye_slash,
                            color: SECONDARY_COLOR,
                            size: 21,
                          ),
                          onPressed: () {
                            // Toggles between show/hide password text
                            passwordController.togglePassword();
                          },
                        )
                      // ignore: dead_code
                      : null,
                  placeholderStyle: const TextStyle(
                      color: INPUT_PLACEHOLDER, fontWeight: FontWeight.w300),
                ),
              ),
            ),

            VerticalSpaceBox(20.h),

            // Login button
            SizedBox(
              width: double.maxFinite,
              child: CupertinoButton(
                color: MAIN_COLOR,
                child: const Text("Login"),
                onPressed: () {
                  loginController.validateEmail();
                  loginController.validatePassword();
                },
              ),
            ),

            VerticalSpaceBox(400.h),

            // Bottom helper menu
            const BottomHelpMenu(),
          ],
        ),
      ),
    );
  }
}
