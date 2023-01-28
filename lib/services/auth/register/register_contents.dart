import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX package
import 'package:get/get.dart';
import 'package:sample/configs/route_names.dart';
import 'package:sample/controllers/auth/password_field_controller.dart';
import 'package:sample/controllers/auth/register/register_controller.dart';
import 'package:sample/controllers/location/location_controller.dart';

// Other packages
import 'package:sample/configs/theme.dart';
import 'package:sample/services/auth/bottom_help_menu.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/screens/completeProfile/personal_details_screen.dart';

class RegisterContents extends StatelessWidget {
  const RegisterContents({super.key});

  // Input fields controller
  static final registerController = Get.put(RegisterController());

  // Define location details controller
  static final locationController = Get.put(LocationController())
;  // Password controller
  static final passwordController = Get.put(PasswordFieldController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30.w, right: 30.w),
      child: Column(
        children: [
          // Name input field
          SizedBox(
            height: 55.h,
            child: CupertinoTextField(
              keyboardType: TextInputType.name,
              onChanged: (value) {
                registerController.storeName(value);
              },
              placeholder: "Enter your full name",
              prefix: Obx(() => registerController.nameHasError.value
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

          // Name error handler widget
          Obx(
            () => registerController.nameHasError.value
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 6.h),
                        child: Text(
                          "Enter a valid name !",
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

          // Email input field
          SizedBox(
            height: 55.h,
            child: CupertinoTextField(
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                registerController.storeEmail(value);
              },
              placeholder: "Enter your email",
              prefix: Obx(() => registerController.emailHasError.value
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
            () => registerController.emailHasError.value
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

          // Phone number input field
          SizedBox(
            height: 55.h,
            child: CupertinoTextField(
              keyboardType: TextInputType.phone,
              onChanged: (value) {
                registerController.storePhoneNumber(value);
              },
              placeholder: "(+${locationController.selectedCountryCode}) xxx-xxx-xxxx",
              prefix: Obx(() => registerController.phoneNumberHasError.value
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

          // Phone number error handler widget
          Obx(
            () => registerController.phoneNumberHasError.value
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 6.h),
                        child: Text(
                          "Enter a valid phone number !",
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
                  registerController.storePassword(value);
                },
                placeholder: "Enter a secure password",
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
                prefix: Obx(() => registerController.passwordHasError.value
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
          ),

          // Password error handler widget
          Obx(
            () => registerController.passwordHasError.value
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 6.h),
                        child: Text(
                          "Password must contain combination of characters",
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

          VerticalSpaceBox(30.h),

          // Agreement section
          Text(
            "By clicking Agree & Join, you agree to the Aware User Agreement, and Privacy Policy",
            style: TextStyle(color: INPUT_PLACEHOLDER, fontSize: 13.sp),
            textAlign: TextAlign.center,
          ),

          VerticalSpaceBox(5.h),

          // Login button
          SizedBox(
            width: double.maxFinite,
            child: Obx(
              () => CupertinoButton.filled(
                child: registerController.spinnerStatus.value
                    ? const CupertinoActivityIndicator(
                        color: BACKGROUND_COLOR,
                      )
                    : const Text("Agree & Join"),
                onPressed: () {
                  // Perform validation process
                  registerController.validateName();
                  registerController.validatePhoneNumber();
                  registerController.validateEmail();
                  registerController.validatePassword();
                  // Open redirection gateway
                  registerController.setAuthorized();

                  // Redirect to complete profile
                  if (registerController.hasPermission.isTrue) {
                    // Toggle method to display spinner during API calls
                    registerController.toggleLoading();
                    Timer(
                      const Duration(seconds: 3),
                      () {
                        // Redirection route
                        Get.off(const PersonalDetailsScreen());
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
                Text("Already on Aware ?",
                    style: TextStyle(color: PRIMARY_COLOR, fontSize: 13.sp)),
                CupertinoButton(
                  padding: const EdgeInsets.all(0),
                  child: Text(
                    " Login now",
                    style: TextStyle(
                      fontSize: 13.sp,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onPressed: () {
                    Get.toNamed(login);
                  },
                ),
              ],
            ),
          ),

          VerticalSpaceBox(160.h),

          // Bottom help menu
          const BottomHelpMenu(),
        ],
      ),
    );
  }
}
