import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX package
import 'package:get/get.dart';
import 'package:sample/configs/route_names.dart';

// Other packages
import 'package:sample/configs/theme.dart';

// A menu in bottom of Auth screens
class BottomHelpMenu extends StatelessWidget {
  const BottomHelpMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Support
        Container(
          margin: const EdgeInsets.only(left: 10, right: 10).w,
          child: CupertinoButton(
            padding: EdgeInsets.zero,
            child: Text(
              "Support",
              style: TextStyle(fontSize: 15.sp, color: INPUT_PLACEHOLDER),
            ),
            onPressed: () {
              Get.toNamed(supportMenu);
            },
          ),
        ),

        // Forget password
        Container(
          margin: const EdgeInsets.only(left: 10, right: 10).w,
          child: CupertinoButton(
            padding: EdgeInsets.zero,
            child: Text(
              "Forget password",
              style: TextStyle(fontSize: 15.sp, color: INPUT_PLACEHOLDER),
            ),
            onPressed: () {
              Get.toNamed(passwordRecovery);
            },
          ),
        ),

        // Terms & Conditions, Privacy Policy, etc.
        Container(
          margin: const EdgeInsets.only(left: 10, right: 10).w,
          child: CupertinoButton(
            padding: EdgeInsets.zero,
            child: Text(
              "Agreement",
              style: TextStyle(fontSize: 15.sp, color: INPUT_PLACEHOLDER),
            ),
            onPressed: () {
              Get.toNamed(details);
            },
          ),
        ),
      ],
    );
  }
}
