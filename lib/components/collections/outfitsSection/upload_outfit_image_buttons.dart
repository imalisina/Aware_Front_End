import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX packages
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sample/controllers/collections/outfits/outfits_controller.dart';

// Other packages
import 'package:sample/configs/theme.dart';

class UpdateOutfitImageButtons extends StatelessWidget {
  const UpdateOutfitImageButtons({super.key});

  // Define outfits controller
  static final outfitsController = Get.put(OutfitsController());

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
              outfitsController.getUploadedImage(ImageSource.gallery);
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
              outfitsController.getUploadedImage(ImageSource.camera);
            },
          ),
        ),
      ],
    );
  }
}
