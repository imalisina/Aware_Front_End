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
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/components/collections/relationSection/edit_relation_modal.dart';
import 'package:sample/components/collections/relationSection/delete_relation_dialog.dart';
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
                // Relation details
                RelationDetailsSection(
                  name: friend.name,
                  gender: friend.gender,
                  age: friend.age,
                  relation: friend.relation,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Relation edit button
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      // Opens a model to change the details of selected relation/friend
                      onPressed: () => showCupertinoModalPopup(
                        context: context,
                        builder: (BuildContext context) {
                          return EditRelationModal(
                            name: friend.name,
                            age: friend.age,
                          );
                        },
                      ),
                      child: const Icon(
                        Icons.edit,
                        color: INPUT_PLACEHOLDER,
                      ),
                    ),

                    // Relation delete button
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => showCupertinoDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return DeleteRelationDialog(relationId: index);
                        },
                      ),
                      child: const Icon(
                        Icons.delete_forever_rounded,
                        color: ERROR_COLOR,
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
