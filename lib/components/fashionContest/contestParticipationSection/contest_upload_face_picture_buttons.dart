import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

// Other packages
import 'package:sample/configs/theme.dart';
import 'package:sample/controllers/fashionContest/contest_participation_controller.dart';

class ContestUploadFacePictureButtons extends StatelessWidget {
  const ContestUploadFacePictureButtons({super.key});

  // Define contest participation controller
  static final contestParticipationController =
      Get.put(ContestParticipationController());

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // Pick from gallery button
        SizedBox(
          width: 100.w,
          child: CupertinoButton(
            padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
            color: PRIMARY_COLOR,
            borderRadius: BorderRadius.circular(40.r),
            child: Icon(
              Icons.perm_media_rounded,
              color: BACKGROUND_COLOR,
              size: 30.sp,
            ),
            onPressed: () {
              contestParticipationController
                  .getUploadedFaceImage(ImageSource.gallery);
            },
          ),
        ),

        // Take picture
        SizedBox(
          width: 100.w,
          child: CupertinoButton(
            padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
            color: PRIMARY_COLOR,
            borderRadius: BorderRadius.circular(40.r),
            child: Icon(
              Icons.add_a_photo_rounded,
              color: BACKGROUND_COLOR,
              size: 30.sp,
            ),
            onPressed: () {
              contestParticipationController
                  .getUploadedFashionPoseImage(ImageSource.camera);
            },
          ),
        ),
      ],
    );
  }
}
