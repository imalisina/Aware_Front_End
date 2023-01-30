import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX packages
import 'package:get/get.dart';
import 'package:sample/controllers/collections/relations/relations_controller.dart';

// Other packages
import 'package:sample/configs/theme.dart';
import 'package:sample/models/relations.dart';
import 'package:sample/packages/flush_bar_method.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/components/collections/relationSection/relation_update_form.dart';
import 'package:sample/components/collections/relationSection/relation_details_section.dart';

class RelationsList extends StatelessWidget {
  const RelationsList({super.key});

  // Define relations controller
  static final relationsController = Get.put(RelationsController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      height: 600.h,
      child: ListView.separated(
        itemCount: Relations().relations.length,
        separatorBuilder: (context, _) => VerticalSpaceBox(10.h),
        itemBuilder: (context, index) {
          final friend = Relations().relations[index];
          return DottedBorder(
            padding: EdgeInsets.only(
                top: 20.h, bottom: 20.h, left: 10.w, right: 10.w),
            borderType: BorderType.RRect,
            dashPattern: const [5, 0.1],
            radius: Radius.circular(5.r),
            color: GHOST_COLOR,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RelationDetailsSection(
                  name: friend.name,
                  gender: friend.gender,
                  age: friend.age,
                  relation: friend.relation,
                ),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  // Opens a model to change the details of selected relation/friend
                  onPressed: () => showCupertinoModalPopup(
                    context: context,
                    builder: (BuildContext context) {
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
                                  name: friend.name,
                                  age: friend.age,
                                ),

                                VerticalSpaceBox(20.h),

                                // Validate updated relation's details
                                SizedBox(
                                  width: 100.w,
                                  child: Obx(
                                    () => CupertinoButton.filled(
                                      padding: EdgeInsets.only(
                                          left: 40.w,
                                          right: 40.w,
                                          top: 10.h,
                                          bottom: 10.h),
                                      child: relationsController
                                              .spinnerStatus.value
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
                                        relationsController
                                            .updateFriendDetails();

                                        // Redirect to profile confirmation screen
                                        if (relationsController
                                            .isUpdatable.isTrue) {
                                          // Togge method to display spinner during API calls
                                          relationsController.toggleLoading();
                                          showSnackBar(context,
                                              "Relation details has been edited successfully !");
                                          Timer(
                                            const Duration(milliseconds: 1000),
                                            () {
                                              Get.back();
                                              Get.back();
                                              relationsController
                                                  .toggleLoading();
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
                    },
                  ),
                  child: const Icon(
                    Icons.edit,
                    color: INPUT_PLACEHOLDER,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
