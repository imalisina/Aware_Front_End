import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX packages
import 'package:get/get.dart';
import 'package:sample/controllers/settings/updateEmail/update_email_controller.dart';
import 'package:sample/controllers/settings/updateEmail/new_email_validation_controller.dart';

// Other packages
import 'package:sample/app/app_container.dart';
import 'package:sample/configs/theme.dart';
import 'package:sample/packages/flush_bar_method.dart';
import 'package:sample/packages/space_box_container.dart';

class NewEmailVerificationContents extends StatelessWidget {
  const NewEmailVerificationContents({super.key});

  // Define new email verification controller
  static final newEmailVerificationController =
      Get.put(NewEmailVerificationController());

  // Define update email controller
  static final updateEmailController = Get.put(UpdateEmailController());

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
                newEmailVerificationController.storeVerificationCode(value);
              },
              placeholder: "Enter the verification code",
              prefix: Obx(() =>
                  newEmailVerificationController.verificationCodeHasError.value
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
            () => newEmailVerificationController.verificationCodeHasError.value
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
                child: newEmailVerificationController.spinnerStatus.value
                    ? const CupertinoActivityIndicator(
                        color: BACKGROUND_COLOR,
                      )
                    : const Text("Verify"),
                onPressed: () {
                  // Perform validation process
                  newEmailVerificationController.validateVerificationCode();
                  // Open redirection gateway
                  newEmailVerificationController.setAuthorized();

                  // Redirect to reset password screen
                  if (newEmailVerificationController.hasPermission.isTrue) {
                    // Toggle method to display spinner during API calls
                    newEmailVerificationController.toggleLoading();
                    updateEmailController.updateEmail();
                    Timer(
                      const Duration(seconds: 3),
                      () {
                        // Redirection route
                        Get.off(const AppContainer());
                        showSnackBar(
                            context, "Email has been updated successfully !");
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
