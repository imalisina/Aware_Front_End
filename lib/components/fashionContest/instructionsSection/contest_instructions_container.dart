import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX packages
import 'package:get/get.dart';
import 'package:sample/controllers/fashionContest/contest_instructions_controller.dart';

// Other packages
import 'package:sample/configs/theme.dart';
import 'package:sample/packages/space_box_container.dart';

class ContestInstructionsContainer extends StatelessWidget {
  const ContestInstructionsContainer({super.key});

  // Define contest instructions controller
  static final contestInstructionsController =
      Get.put(ContestInstructionsController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Contest name detail
        DottedBorder(
          padding:
              EdgeInsets.only(top: 20.h, bottom: 20.h, left: 10.w, right: 10.w),
          borderType: BorderType.RRect,
          dashPattern: const [5, 0.1],
          radius: Radius.circular(5.r),
          color: GHOST_COLOR,
          child: Row(
            children: [
              Icon(
                Icons.offline_bolt_rounded,
                size: 25.sp,
              ),
              HorizontalSpaceBox(3.w),
              SizedBox(
                width: 240.w,
                child: Text(
                  contestInstructionsController.contestName,
                  overflow: TextOverflow.ellipsis,
                  style: contestInstructionsDetailStyle,
                ),
              ),
            ],
          ),
        ),

        VerticalSpaceBox(10.h),

        // Contest theme detail
        DottedBorder(
          padding:
              EdgeInsets.only(top: 20.h, bottom: 20.h, left: 10.w, right: 10.w),
          borderType: BorderType.RRect,
          dashPattern: const [5, 0.1],
          radius: Radius.circular(5.r),
          color: GHOST_COLOR,
          child: Row(
            children: [
              Icon(
                Icons.category_rounded,
                size: 25.sp,
              ),
              HorizontalSpaceBox(3.w),
              SizedBox(
                width: 240.w,
                child: Text(
                  contestInstructionsController.contestTheme,
                  overflow: TextOverflow.ellipsis,
                  style: contestInstructionsDetailStyle,
                ),
              ),
            ],
          ),
        ),

        VerticalSpaceBox(10.h),

        // Contest gender detail
        DottedBorder(
          padding:
              EdgeInsets.only(top: 20.h, bottom: 20.h, left: 10.w, right: 10.w),
          borderType: BorderType.RRect,
          dashPattern: const [5, 0.1],
          radius: Radius.circular(5.r),
          color: GHOST_COLOR,
          child: Row(
            children: [
              Icon(
                Icons.groups_rounded,
                size: 25.sp,
              ),
              HorizontalSpaceBox(4.w),
              SizedBox(
                width: 240.w,
                child: Text(
                  contestInstructionsController.participantsGender,
                  overflow: TextOverflow.ellipsis,
                  style: contestInstructionsDetailStyle,
                ),
              ),
            ],
          ),
        ),

        VerticalSpaceBox(10.h),

        // Contest deadline detail
        DottedBorder(
          padding:
              EdgeInsets.only(top: 20.h, bottom: 20.h, left: 10.w, right: 10.w),
          borderType: BorderType.RRect,
          dashPattern: const [5, 0.1],
          radius: Radius.circular(5.r),
          color: GHOST_COLOR,
          child: Row(
            children: [
              Icon(
                Icons.timer_rounded,
                size: 25.sp,
              ),
              HorizontalSpaceBox(4.w),
              SizedBox(
                width: 240.w,
                child: Text(
                  "Open until ${contestInstructionsController.contestDeadline}",
                  overflow: TextOverflow.ellipsis,
                  style: contestInstructionsDetailStyle,
                ),
              ),
            ],
          ),
        ),

        VerticalSpaceBox(10.h),

        // Contest makeup rule detail
        DottedBorder(
          padding:
              EdgeInsets.only(top: 20.h, bottom: 20.h, left: 10.w, right: 10.w),
          borderType: BorderType.RRect,
          dashPattern: const [5, 0.1],
          radius: Radius.circular(5.r),
          color: GHOST_COLOR,
          child: Row(
            children: [
              Icon(
                Icons.warning_rounded,
                size: 25.sp,
              ),
              HorizontalSpaceBox(5.w),
              SizedBox(
                width: 300.w,
                child: Text(
                  "Open until ${contestInstructionsController.makeupRule}",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: SECONDARY_COLOR, fontSize: 18.sp, height: 1.8.h),
                  maxLines: 3,
                ),
              ),
            ],
          ),
        ),

        VerticalSpaceBox(10.h),

        // Contest main rule detail
        DottedBorder(
          padding:
              EdgeInsets.only(top: 20.h, bottom: 20.h, left: 10.w, right: 10.w),
          borderType: BorderType.RRect,
          dashPattern: const [5, 0.1],
          radius: Radius.circular(5.r),
          color: GHOST_COLOR,
          child: Row(
            children: [
              Icon(
                Icons.campaign_rounded,
                size: 30.sp,
              ),
              HorizontalSpaceBox(5.w),
              SizedBox(
                width: 300.w,
                child: Text(
                  contestInstructionsController.contestRule,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: SECONDARY_COLOR, fontSize: 18.sp, height: 1.8.h),
                  maxLines: 10,
                ),
              ),
            ],
          ),
        ),

        VerticalSpaceBox(30.h),
      ],
    );
  }
}
