import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dotted_border/dotted_border.dart';

// Other packages
import 'package:sample/configs/theme.dart';
import 'package:sample/models/places.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample/components/collections/placesSection/edit_place_modal.dart';
import 'package:sample/components/collections/placesSection/delete_place_dialog.dart';
import 'package:sample/components/collections/placesSection/place_details_section.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      height: 600.h,
      child: ListView.separated(
        itemCount: Places().places.length,
        separatorBuilder: (context, _) => VerticalSpaceBox(10.h),
        itemBuilder: (context, index) {
          final place = Places().places[index];
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
                // Place details
                PlaceDetailsSection(
                  placeName: place.placeName,
                  streetName: place.streetName,
                ),

                // Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Place edit button
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      // Opens a model to change the details of selected place
                      onPressed: () => showCupertinoModalPopup(
                        context: context,
                        builder: (BuildContext context) {
                          return EditPlaceModal(
                            placeName: place.placeName,
                          );
                        },
                      ),
                      child: const Icon(
                        Icons.edit,
                        color: INPUT_PLACEHOLDER,
                      ),
                    ),

                    // Place delete button
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      // Opens a dialog to confirm the delete operation
                      onPressed: () => showCupertinoDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return DeletePlaceDialog(placeId: index);
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
