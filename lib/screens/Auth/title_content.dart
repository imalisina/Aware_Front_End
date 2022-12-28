import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample/constants/constants.dart';
import 'package:sample/utils/space_box_container.dart';

class TitleContent extends StatelessWidget {
  // Define states for title and subtitle
  final String? title, subTitle;
  // Getting state from other components
  // ignore: use_key_in_widget_constructors
  const TitleContent(this.title, this.subTitle);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(left: 30).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title ?? "",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 32.sp,
                  color: PRIMARY_COLOR),
            ),
            VerticalSpaceBox(2.h),
            Text(
              subTitle ?? "",
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 16.sp,
                  height: 1.6.h,
                  color: SECONDARY_COLOR),
            ),
          ],
        ),
      ),
    );
  }
}
