import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX packages
import 'package:get/get.dart';
import 'package:sample/controllers/collections/relations/relations_controller.dart';

// Other packages
import 'package:sample/configs/theme.dart';
import 'package:sample/packages/flush_bar_method.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/components/collections/relationSection/relation_update_form.dart';

class EditRelationModal extends StatelessWidget {
  // Define variables to store state values
  final String name, age;
  // Getting state values from relation_list.dart
  // ignore: use_key_in_widget_constructors
  const EditRelationModal({required this.name, required this.age});

  // Define relations controller
  static final relationsController = Get.put(RelationsController());

  @override
  Widget build(BuildContext context) {
    return CupertinoPopupSurface(
      child: Container(
        color: BACKGROUND_COLOR,
        width: double.maxFinite,
        height: 750.h,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CupertinoButton(
                child: const Text(
                  "Close",
                  style: TextStyle(color: SECONDARY_COLOR),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              RelationUpdateForm(
                name: name,
                age: age,
              ),

              VerticalSpaceBox(20.h),

              // Validate updated relation's details
              SizedBox(
                width: 100.w,
                child: Obx(
                  () => CupertinoButton.filled(
                    padding: EdgeInsets.only(
                        left: 40.w, right: 40.w, top: 10.h, bottom: 10.h),
                    child: relationsController.spinnerStatus.value
                        ? const CupertinoActivityIndicator(
                            color: BACKGROUND_COLOR,
                          )
                        : Icon(
                            CupertinoIcons.checkmark_alt,
                            size: 30.sp,
                          ),
                    onPressed: () {
                      // Perform validation process
                      relationsController.validateName();
                      relationsController.validateAge();
                      relationsController.validateGender();
                      relationsController.validateRelation();
                      // Open redirection gateway
                      relationsController.updateFriendDetails();

                      // Redirect to profile confirmation screen
                      if (relationsController.isUpdatable.isTrue) {
                        // Togge method to display spinner during API calls
                        relationsController.toggleLoading();
                        Timer(
                          const Duration(milliseconds: 1000),
                          () {
                            Get.back();
                            showSnackBar(context,
                                "Relation details has been edited successfully !");
                            relationsController.toggleLoading();
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
