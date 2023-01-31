import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX packages
import 'package:get/get.dart';
import 'package:sample/controllers/collections/outfits/outfits_controller.dart';

// Other packages
import 'package:sample/configs/theme.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/components/collections/outfitsSection/upload_outfit_image_buttons.dart';

class OutfitUpdateForm extends StatelessWidget {
  // Define a variable to store state value
  final String name;
  // Getting props from edit_outfit_modal.dart
  // ignore: use_key_in_widget_constructors
  const OutfitUpdateForm({required this.name});

  // Define outfits controller
  static final outfitsController = Get.put(OutfitsController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30.w, right: 30.w),
      child: Obx(
        () => Column(
          children: [
            // Outfit name input field
            SizedBox(
              height: 55.h,
              child: CupertinoTextField(
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  outfitsController.storeName(value);
                },
                placeholder: "Name : $name",
                prefix: outfitsController.nameHasError.value
                    ? Container(
                        margin: EdgeInsets.only(left: 10.w),
                        child: const Icon(
                          CupertinoIcons.clear_thick_circled,
                          color: ERROR_COLOR,
                        ),
                      )
                    : const EmptyBox(),
                textInputAction: TextInputAction.done,
                placeholderStyle: inputPlaceholderStyle,
              ),
            ),

            // Outfit name error handler widget
            outfitsController.nameHasError.value
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 6.h),
                        child: Text(
                          "Enter a valid name !",
                          style: TextStyle(
                              color: ERROR_COLOR,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  )
                : const EmptyBox(),

            VerticalSpaceBox(30.h),

            // Image picker buttons
            const Text(
              "Pick a new image or take a new picture",
              style: TextStyle(color: INPUT_PLACEHOLDER),
            ),

            VerticalSpaceBox(20.h),

            // Pick image or take picture buttons
            const UpdateOutfitImageButtons(),

            VerticalSpaceBox(20.h),

            // DISPLAY TEST IMAGE
            outfitsController.uploadedImagePath.value == ''
                ? const EmptyBox()
                : Column(
                    children: [
                      // Uploaded image preview section
                      SizedBox(
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          color: MAIN_COLOR,
                          dashPattern: const [5, 0.1],
                          radius: Radius.circular(3.r),
                          strokeWidth: 2.w,
                          child: Image.file(
                            File(outfitsController.uploadedImagePath.value),
                            width: 150.w,
                            height: 150.h,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),

                      // Image remove button
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          outfitsController.removeUploadedImage();
                        },
                        child: Text(
                          "Remove",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: MAIN_COLOR,
                            fontSize: 15.sp,
                          ),
                        ),
                      ),
                    ],
                  ),

            // Uploaded image error handler widget
            outfitsController.imageHasError.value
                ? SizedBox(
                    child: Text(
                      "An error occurred while uploading, please try again !",
                      style: TextStyle(
                          color: ERROR_COLOR,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                : const EmptyBox(),
          ],
        ),
      ),
    );
  }
}
