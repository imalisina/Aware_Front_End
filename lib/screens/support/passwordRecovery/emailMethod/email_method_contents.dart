import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX package
import 'package:get/get.dart';
import 'package:sample/configs/route_names.dart';
import 'package:sample/controllers/passwordRecovery/email_method_controller.dart';

// Other package
import 'package:sample/configs/theme.dart';
import 'package:sample/packages/space_box_container.dart';

class EmailMethodContents extends StatelessWidget {
  const EmailMethodContents({super.key});

  // Email method controller
  static final emailMethodController = Get.put(EmailMethodController());

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
                emailMethodController.storeEmail(value);
              },
              placeholder: "Enter your email",
              prefix: Obx(() => emailMethodController.emailHasError.value
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

          // Email error handler widget
          Obx(
            () => emailMethodController.emailHasError.value
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

          // Get code button
          SizedBox(
            width: double.maxFinite,
            child: Obx(
              () => CupertinoButton.filled(
                child: emailMethodController.spinnerStatus.value
                    ? const CupertinoActivityIndicator(
                        color: BACKGROUND_COLOR,
                      )
                    : const Text("Get code"),
                onPressed: () {
                  // Perform validation process
                  emailMethodController.validateEmail();
                  // Open redirection gateway
                  emailMethodController.setAuthorized();

                  // Redirect to reset verification code screen
                  if (emailMethodController.hasPermission.isTrue) {
                    // Toggle method to display spinner during API calls
                    emailMethodController.toggleLoading();
                    Timer(
                      const Duration(seconds: 1),
                      () {
                        // Redirection route
                        Get.toNamed(
                            emailVerification);
                        emailMethodController.toggleLoading();
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
