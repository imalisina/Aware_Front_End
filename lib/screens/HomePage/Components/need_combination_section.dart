import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dotted_border/dotted_border.dart';

// Other packages
import 'package:sample/constants/constants.dart';
import 'package:sample/utils/space_box_container.dart';

class NeedCombinationSection extends StatelessWidget {
  const NeedCombinationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      strokeWidth: 2.w,
      dashPattern: const [5, 5],
      // Box content
      child: CupertinoButton(
        padding:
            EdgeInsets.only(top: 20.h, bottom: 20.h, left: 15.w, right: 15.w),
        onPressed: () {
          // Redirection route goes here ....
        },
        // Title, sub-title and Icon elements
        child: Column(
          children: [
            Icon(
              CupertinoIcons.cube_box_fill,
              color: PRIMARY_COLOR,
              size: 50.sp,
            ),
            VerticalSpaceBox(3.h),
            Text(
              "Need Combination ?",
              style: TextStyle(color: PRIMARY_COLOR, fontSize: 25.sp),
            ),
            VerticalSpaceBox(5.h),
            Text(
              "Generate new combination for new event or place",
              style: TextStyle(
                  color: SECONDARY_COLOR,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
    );
  }
}
