import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX packages
import 'package:get/get.dart';
import 'package:sample/controllers/settings/updateEmail/update_email_controller.dart';

// Other packages
import 'package:sample/configs/route_names.dart';
import 'package:sample/configs/theme.dart';
import 'package:sample/packages/flush_bar_method.dart';
import 'package:sample/packages/space_box_container.dart';

class UpdateEmailContent extends StatelessWidget {
  const UpdateEmailContent({super.key});

  // Define update email controller
  static final updateEmailController = Get.put(UpdateEmailController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30.w, right: 30.w),
      child: Column(
        children: [
          // Current email read-only input field
          SizedBox(
            height: 55.h,
            child: Obx(
              () => CupertinoTextField(
                placeholder:
                    "Current email : ${updateEmailController.currentEmail}",
                placeholderStyle: inputActiveDataPlaceholderStyle,
                readOnly: true,
              ),
            ),
          ),

          VerticalSpaceBox(20.h),

          // New email input field
          SizedBox(
            height: 55.h,
            child: CupertinoTextField(
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                updateEmailController.storeEmail(value);
              },
              placeholder: "Enter a new email",
              prefix: Obx(
                () => updateEmailController.emailHasError.value
                    ? Container(
                        margin: EdgeInsets.only(left: 10.w),
                        child: const Icon(
                          CupertinoIcons.clear_thick_circled,
                          color: ERROR_COLOR,
                        ),
                      )
                    : const EmptyBox(),
              ),
              textInputAction: TextInputAction.done,
              placeholderStyle: inputPlaceholderStyle,
            ),
          ),

          // New email error handler widget
          Obx(
            () => updateEmailController.emailHasError.value
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 6.h),
                        child: Text(
                          "New email is not valid !",
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
                child: updateEmailController.spinnerStatus.value
                    ? const CupertinoActivityIndicator(
                        color: BACKGROUND_COLOR,
                      )
                    : const Text("Get code"),
                onPressed: () {
                  // Perform validation process
                  updateEmailController.validateEmail();
                  // Open redirection gateway
                  updateEmailController.setAuthorized();

                  // Redirect to verification code screen
                  if (updateEmailController.hasPermission.isTrue) {
                    // Toggle method to display spinner during API calls
                    updateEmailController.toggleLoading();
                    Timer(
                      const Duration(seconds: 1),
                      () {
                        // Redirection route
                        Get.toNamed(verifyNewEmail);
                        updateEmailController.toggleLoading();
                        showSnackBar(context,
                            "A verification code has been sent to your current email !");
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
