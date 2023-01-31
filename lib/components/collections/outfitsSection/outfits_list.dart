import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Other packages
import 'package:sample/configs/theme.dart';
import 'package:sample/models/outfits.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/components/collections/outfitsSection/edit_outfit_modal.dart';
import 'package:sample/components/collections/outfitsSection/outfit_main_details.dart';
import 'package:sample/components/collections/outfitsSection/delete_outfit_dialog.dart';
import 'package:sample/components/collections/outfitsSection/outfit_additional_details.dart';

class OutfitsList extends StatelessWidget {
  const OutfitsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      height: 600.h,
      child: ListView.separated(
        itemCount: Outfits().outfits.length,
        separatorBuilder: (context, _) => VerticalSpaceBox(10.h),
        itemBuilder: (context, index) {
          final outfit = Outfits().outfits[index];
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
                // Outfit details
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Outfit main details
                    OutfitMainDetails(
                      outfitName: outfit.name,
                      outfitPicture: outfit.picture,
                    ),

                    VerticalSpaceBox(8.h),

                    // Outfit additional details
                    OutfitAdditionalDetails(
                      outfitCategory: outfit.category,
                      outfitSubcategory: outfit.subCategory,
                    ),
                  ],
                ),

                // Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Outfit edit button
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => showCupertinoModalPopup(
                        context: context,
                        builder: (BuildContext context) {
                          return EditOutfitModal(
                            name: outfit.name,
                          );
                        },
                      ),
                      child: const Icon(
                        Icons.edit,
                        color: INPUT_PLACEHOLDER,
                      ),
                    ),

                    // Outfit delete button
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => showCupertinoDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return DeleteOutfitDialog(outfitId: index);
                        },
                      ),
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
