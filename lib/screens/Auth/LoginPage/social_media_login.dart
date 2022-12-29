import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample/constants/constants.dart';

class SocialMediaLogin extends StatelessWidget {
  const SocialMediaLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Option divider section
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 120.w, child: const Divider()),
            Text(
              "OR",
              style: TextStyle(color: INPUT_PLACEHOLDER, fontSize: 14.sp),
            ),
            SizedBox(width: 120.w, child: const Divider()),
          ],
        ),

        // Login alternatives section
        CupertinoButton(
          onPressed: () {},
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5).r,
              border: Border.all(
                color: INPUT_PLACEHOLDER,
                style: BorderStyle.solid,
              ),
            ),
            child: const Text("Login Option One"),
          ),
        ),
      ],
    );
  }
}
