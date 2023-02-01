import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX packages
import 'package:get/get.dart';
import 'package:sample/controllers/collections/accessories/accessories_controller.dart';

// Other packages
import 'package:sample/configs/theme.dart';
import 'package:sample/packages/flush_bar_method.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/components/collections/accessoriesSection/accessory_update_form.dart';

class EditAccessoryModal extends StatelessWidget {
  // Define a variable to store the state value
  final String name;
  // Getting props from accessories_list.dart
  // ignore: use_key_in_widget_constructors
  const EditAccessoryModal({required this.name});

  // Define accessories controller
  static final accessoriesController = Get.put(AccessoriesController());

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
                  accessoriesController.onDelete;
                },
                child: const Text(
                  "Close",
                  style: TextStyle(color: SECONDARY_COLOR),
                ),
              ),

              // Accessory update form section
              AccessoryUpdateForm(name: name),

              VerticalSpaceBox(30.h),

              // Validate updated accessory's details
              SizedBox(
                width: 100.w,
                child: Obx(
                  () => CupertinoButton.filled(
                    padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                    child: accessoriesController.spinnerStatus.value
                        ? const CupertinoActivityIndicator(
                            color: BACKGROUND_COLOR,
                          )
                        : Icon(
                            Icons.check_rounded,
                            size: 30.sp,
                          ),
                    onPressed: () {
                      // Perform validation process
                      accessoriesController.validateName();
                      accessoriesController.validateImage();
                      // Open redirection gateway
                      accessoriesController.updateAccessoryDetails();

                      // Redirect to profile confirmation screen
                      if (accessoriesController.isUpdatable.isTrue) {
                        // Togge method to display spinner during API calls
                        accessoriesController.toggleLoading();
                        Timer(
                          const Duration(milliseconds: 1000),
                          () {
                            Get.back();
                            showSnackBar(context,
                                "Accessory details has been edited successfully !");
                            accessoriesController.toggleLoading();
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
