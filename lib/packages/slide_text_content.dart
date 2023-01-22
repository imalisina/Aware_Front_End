import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample/configs/theme.dart';

// Other packages
import 'package:sample/packages/space_box_container.dart';

class TextSlogan extends StatelessWidget {
  // Define title and subtitle
  final String title;
  final String subTitle;
  // Getting states from other components
  // ignore: use_key_in_widget_constructors
  const TextSlogan(this.title, this.subTitle);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 32.sp,
                color: PRIMARY_COLOR),
          ),
          VerticalSpaceBox(8.h),
          SizedBox(
            width: 340.w,
            child: Text(
              subTitle,
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 16.sp,
                  height: 1.6.h,
                  color: SECONDARY_COLOR),
            ),
          ),
        ],
      ),
    );
  }
}
