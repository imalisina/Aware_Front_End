import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX packages
import 'package:get/get.dart';
import 'package:sample/controllers/collections/accessories/accessories_controller.dart';

// Other packages
import 'package:sample/configs/theme.dart';

class UpdateAccessoryImageButtons extends StatelessWidget {
  const UpdateAccessoryImageButtons({super.key});

  // Define accessories controller
  static final accessoriesController = Get.put(AccessoriesController());

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
              accessoriesController.getUploadedImage(ImageSource.gallery);
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
              accessoriesController.getUploadedImage(ImageSource.camera);
            },
          ),
        ),
      ],
    );
  }
}
