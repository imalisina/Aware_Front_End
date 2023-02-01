import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX packages
import 'package:get/get.dart';
import 'package:sample/controllers/fashionContest/contest_awards_controller.dart';

// Other packages
import 'package:sample/configs/theme.dart';
import 'package:sample/packages/space_box_container.dart';

class ThirdWinnerAwardDetails extends StatelessWidget {
  const ThirdWinnerAwardDetails({super.key});

  // Define contest awards controller
  static final contestAwardsController = Get.put(ContestAwardsController());

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      padding:
          EdgeInsets.only(top: 20.h, bottom: 20.h, left: 10.w, right: 10.w),
      borderType: BorderType.RRect,
      dashPattern: const [5, 0.1],
      radius: Radius.circular(5.r),
      color: GHOST_COLOR,
      // Display first winner award details
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // First winner title
          SizedBox(
            width: 240.w,
            child: Text(
              "Third winner",
              overflow: TextOverflow.ellipsis,
              style: contestAwardDetailsTitle,
            ),
          ),

          VerticalSpaceBox(10.h),

          // First winner awards list
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // First award detail
              Row(
                children: [
                  Icon(
                    Icons.emoji_events_rounded,
                    size: 25.sp,
                  ),
                  HorizontalSpaceBox(3.w),
                  SizedBox(
                    width: 300.w,
                    child: Text(
                      contestAwardsController.thirdWinnerAwards[0],
                      overflow: TextOverflow.ellipsis,
                      style: contestAwardDetailStyles,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
