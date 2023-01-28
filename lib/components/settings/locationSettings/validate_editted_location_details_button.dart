import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:sample/configs/theme.dart';
import 'package:sample/controllers/locationSettings/location_settings_controller.dart';

class ValidateEdittedLocationDetailsButton extends StatelessWidget {
  const ValidateEdittedLocationDetailsButton({super.key});

  // Define location settings controller
  static final locationSettingsController = Get.put(LocationSettingsController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        width: 60.w,
        height: 60.h,
        child: LikeButton(
          // Button animation styles
          circleColor: const CircleColor(start: MAIN_COLOR, end: GHOST_COLOR),
          bubblesColor: const BubblesColor(
            dotPrimaryColor: MAIN_COLOR,
            dotSecondaryColor: PRIMARY_COLOR,
            dotThirdColor: PRIMARY_COLOR,
            dotLastColor: PRIMARY_COLOR,
          ),
          // Toggle like status and handle operation in controller
          onTap: (isLiked) async {
            locationSettingsController.toggleReadOnly();
            if (!isLiked) {
              // Handle storing operation
            }
            return locationSettingsController.isReadOnly.value;
          },
          size: 30.sp,
          isLiked: locationSettingsController.isReadOnly.value,
          likeBuilder: (isLiked) {
            return DottedBorder(
              borderType: BorderType.RRect,
              borderPadding: EdgeInsets.only(
                  left: 40.w, right: 40.w, bottom: 40.h, top: 44.h),
              radius: Radius.circular(5.r),
              strokeWidth: 2,
              // Toggle color values based on isReadOnly status
              color: isLiked ? INPUT_PLACEHOLDER : MAIN_COLOR,
              dashPattern: const [5, 2],
              child: Icon(
                isLiked ? CupertinoIcons.pen : CupertinoIcons.floppy_disk,
                color: isLiked ? INPUT_PLACEHOLDER : MAIN_COLOR,
                size: 30.sp,
              ),
            );
          },
        ),
      ),
    );
  }
}
