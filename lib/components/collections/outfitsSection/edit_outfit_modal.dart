import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX packages
import 'package:get/get.dart';
import 'package:sample/controllers/collections/outfits/outfits_controller.dart';

// Other packages
import 'package:sample/configs/theme.dart';
import 'package:sample/packages/flush_bar_method.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/components/collections/outfitsSection/outfit_update_form.dart';

class EditOutfitModal extends StatelessWidget {
  // Define a variable to store the state value
  final String name;
  // Getting props from outfits_list.dart
  // ignore: use_key_in_widget_constructors
  const EditOutfitModal({required this.name});

  // Define outfits controller
  static final outfitsController = Get.put(OutfitsController());

  @override
  Widget build(BuildContext context) {
    return CupertinoPopupSurface(
      child: Container(
        color: BACKGROUND_COLOR,
        width: double.maxFinite,
        height: 600.h,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CupertinoButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  outfitsController.onDelete;
                },
                child: const Text(
                  "Close",
                  style: TextStyle(color: SECONDARY_COLOR),
                ),
              ),

              // Outfit update form section
              OutfitUpdateForm(name: name),

              VerticalSpaceBox(30.h),

              // Validate updated outfit's details
              SizedBox(
                width: 100.w,
                child: Obx(
                  () => CupertinoButton.filled(
                    padding: EdgeInsets.only(
                        left: 40.w, right: 40.w, top: 10.h, bottom: 10.h),
                    child: outfitsController.spinnerStatus.value
                        ? const CupertinoActivityIndicator(
                            color: BACKGROUND_COLOR,
                          )
                        : Icon(
                            CupertinoIcons.checkmark_alt,
                            size: 30.sp,
                          ),
                    onPressed: () {
                      // Perform validation process
                      outfitsController.validateName();
                      outfitsController.validateImage();
                      // Open redirection gateway
                      outfitsController.updateOutfitDetails();

                      // Redirect to profile confirmation screen
                      if (outfitsController.isUpdatable.isTrue) {
                        // Togge method to display spinner during API calls
                        outfitsController.toggleLoading();
                        Timer(
                          const Duration(milliseconds: 1000),
                          () {
                            Get.back();
                            showSnackBar(context,
                                "Outfit details has been edited successfully !");
                            outfitsController.toggleLoading();
                          },
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
