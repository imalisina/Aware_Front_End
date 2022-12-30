import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample/constants/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sample/utils/space_box_container.dart';

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

        VerticalSpaceBox(15.h),

        // Login alternatives section

        // Google login
        SizedBox(
          width: 400.w,
          height: 60.h,
          child: CupertinoButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/images/icons/google_login.svg",
                  width: 22.w,
                  height: 22.h,
                ),
                HorizontalSpaceBox(10.w),
                const Text(
                  "Continue with Google",
                  style: TextStyle(color: PRIMARY_COLOR),
                ),
              ],
            ),
          ),
        ),

        SizedBox(
          width: 100.w,
          child: const Divider(),
        ),

        // TikTok login
        SizedBox(
          width: 400.w,
          height: 60.h,
          child: CupertinoButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/images/icons/tiktok_login.svg",
                  width: 22.w,
                  height: 22.h,
                ),
                HorizontalSpaceBox(10.w),
                const Text(
                  "Continue with TikTok",
                  style: TextStyle(color: PRIMARY_COLOR),
                ),
              ],
            ),
          ),
        ),

        SizedBox(
          width: 100.w,
          child: const Divider(),
        ),

        // TikTok login
        SizedBox(
          width: 400.w,
          height: 60.h,
          child: CupertinoButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/images/icons/insta_login.svg",
                  width: 22.w,
                  height: 22.h,
                ),
                HorizontalSpaceBox(10.w),
                const Text(
                  "Continue with TikTok",
                  style: TextStyle(color: PRIMARY_COLOR),
                ),
              ],
            ),
          ),
        ),

        SizedBox(
          width: 100.w,
          child: const Divider(),
        ),

        // Twitter login
        SizedBox(
          width: 400.w,
          height: 60.h,
          child: CupertinoButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "assets/images/icons/twitter_login.svg",
                  width: 22.w,
                  height: 22.h,
                ),
                HorizontalSpaceBox(10.w),
                const Text(
                  "Continue with Twitter",
                  style: TextStyle(color: PRIMARY_COLOR),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
