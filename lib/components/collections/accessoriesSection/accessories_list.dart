import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Other packages
import 'package:sample/configs/theme.dart';
import 'package:sample/models/accessories.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/components/collections/accessoriesSection/edit_accessory_modal.dart';
import 'package:sample/components/collections/accessoriesSection/accessory_main_details.dart';
import 'package:sample/components/collections/accessoriesSection/accessory_additional_details.dart';

class AccessoriesList extends StatelessWidget {
  const AccessoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      height: 600.h,
      child: ListView.separated(
        itemCount: Accessories().accessories.length,
        separatorBuilder: (context, _) => VerticalSpaceBox(10.h),
        itemBuilder: (context, index) {
          final accessory = Accessories().accessories[index];
          return DottedBorder(
            padding: EdgeInsets.only(
                left: 10.w, right: 10.w, top: 10.h, bottom: 10.h),
            borderType: BorderType.RRect,
            dashPattern: const [5, 0.1],
            radius: Radius.circular(5.r),
            color: GHOST_COLOR,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Accessory details
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Accessory main details
                    AccessoryMainDetails(
                      accessoryName: accessory.name,
                      accessoryPicture: accessory.picture,
                    ),

                    VerticalSpaceBox(8.h),

                    // Accessory additional details
                    AccessoryAdditionalDetails(
                      accessoryCategory: accessory.category,
                      accessorySubcategory: accessory.subCategory,
                    ),
                  ],
                ),

                // Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Accessory edit button
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => showCupertinoModalPopup(
                        context: context,
                        builder: (BuildContext context) {
                          return EditAccessoryModal(
                            name: accessory.name,
                          );
                        },
                      ),
                      child: const Icon(
                        Icons.edit,
                        color: INPUT_PLACEHOLDER,
                      ),
                    ),

                    // Accessory delete button
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      child: const Icon(
                        Icons.delete_forever_rounded,
                        color: ERROR_COLOR,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
