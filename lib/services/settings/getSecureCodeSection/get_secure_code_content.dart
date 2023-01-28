import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX package
import 'package:get/get.dart';
import 'package:sample/controllers/user/user_controller.dart';

// Other packages
import 'package:sample/configs/theme.dart';
import 'package:sample/packages/flush_bar_method.dart';
import 'package:sample/packages/space_box_container.dart';

class GetSecureCodeContent extends StatelessWidget {
  const GetSecureCodeContent({super.key});

  // Define user controller
  static final userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30.w, right: 30.w),
      child: Column(
        children: [
          // Secure Code input
          SizedBox(
            height: 55.h,
            child: CupertinoTextField(
              // Secure code data
              placeholder: userController.appUser.secureCode,
              placeholderStyle: inputActiveDataPlaceholderStyle,
              readOnly: true,
              // Copy to clipboard button as suffix
              suffix: CupertinoButton(
                child: Obx(
                  () => Icon(
                    userController.isCopied.isFalse
                        ? CupertinoIcons.doc_on_clipboard
                        : CupertinoIcons.checkmark_alt_circle_fill,
                    color: userController.isCopied.isFalse
                        ? INPUT_PLACEHOLDER
                        : AGREE_COLOR,
                  ),
                ),
                onPressed: () {
                  FlutterClipboard.copy(userController.appUser.secureCode);
                  userController.setCopied();
                  showSnackBar(
                      context, "Secure code has been copied to clipboard !");
                  Timer(
                    const Duration(seconds: 1),
                    () {
                      userController.openCopyButton();
                    },
                  );
                },
              ),
            ),
          ),

          VerticalSpaceBox(10.h),

          // Security note
          SizedBox(
            width: double.maxFinite,
            // Title
            child: Text(
              "Security note : Do not share this code with others as they can access to your account and details with this code.",
              style: TextStyle(
                color: MAIN_COLOR,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
