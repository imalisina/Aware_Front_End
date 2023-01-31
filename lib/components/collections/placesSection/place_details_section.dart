import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Other packages
import 'package:sample/configs/theme.dart';
import 'package:sample/packages/space_box_container.dart';

class PlaceDetailsSection extends StatelessWidget {
  // Define states to store differnet values
  final String placeName, streetName;
  // Getting props from places_list.dart
  // ignore_for_file: use_key_in_widget_constructors
  const PlaceDetailsSection(
      {required this.placeName, required this.streetName});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Display place name
        SizedBox(
          width: 240.w,
          child: Text(
            placeName,
            overflow: TextOverflow.ellipsis,
          ),
        ),

        VerticalSpaceBox(8.h),

        // Display more detail about place
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Street name
                Icon(
                  Icons.signpost_rounded,
                  size: 18.sp,
                ),
                HorizontalSpaceBox(3.w),
                SizedBox(
                  width: 100.w,
                  child: Text(
                    streetName,
                    overflow: TextOverflow.ellipsis,
                    style: collectionsDetailStyles,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
