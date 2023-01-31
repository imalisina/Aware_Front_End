import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Other packages
import 'package:sample/configs/theme.dart';
import 'package:sample/packages/space_box_container.dart';

class RelationDetailsSection extends StatelessWidget {
  // Define states to store differnet values
  final String name, gender, age, relation;
  // Getting props from relation_list.dart
  // ignore_for_file: use_key_in_widget_constructors
  const RelationDetailsSection(
      {required this.name,
      required this.gender,
      required this.age,
      required this.relation});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Display friend's name
        SizedBox(
          width: 240.w,
          child: Text(
            name,
            overflow: TextOverflow.ellipsis,
          ),
        ),

        VerticalSpaceBox(8.h),

        // Display icons and more details
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Gender section
                Icon(
                  Icons.face_6_rounded,
                  size: 18.sp,
                ),
                HorizontalSpaceBox(3.w),
                SizedBox(
                  width: 100.w,
                  child: Text(
                    gender,
                    overflow: TextOverflow.ellipsis,
                    style: collectionsDetailStyles,
                  ),
                ),
              ],
            ),

            VerticalSpaceBox(6.h),

            // Age section
            Row(
              children: [
                Icon(
                  Icons.today_rounded,
                  size: 18.sp,
                ),
                HorizontalSpaceBox(3.w),
                SizedBox(
                  width: 100.w,
                  child: Text(
                    "$age years old",
                    overflow: TextOverflow.ellipsis,
                    style: collectionsDetailStyles,
                  ),
                ),
              ],
            ),

            VerticalSpaceBox(6.h),

            // Relation section
            Row(
              children: [
                Icon(
                  Icons.diversity_1_rounded,
                  size: 18.sp,
                ),
                HorizontalSpaceBox(5.w),
                SizedBox(
                  width: 100.w,
                  child: Text(
                    relation,
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
