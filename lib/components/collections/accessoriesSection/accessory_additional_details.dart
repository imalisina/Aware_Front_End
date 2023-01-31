import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Other packages
import 'package:sample/configs/theme.dart';
import 'package:sample/packages/space_box_container.dart';

class AccessoryAdditionalDetails extends StatelessWidget {
  // Define states to store different values
  final String accessoryCategory, accessorySubcategory;
  // Getting props from accessories_list.dart
  // ignore: use_key_in_widget_constructors
  const AccessoryAdditionalDetails(
      {required this.accessoryCategory, required this.accessorySubcategory});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Category section
        Icon(
          Icons.category_rounded,
          size: 18.sp,
        ),
        HorizontalSpaceBox(3.w),
        Text(
          accessoryCategory,
          style: collectionsDetailStyles,
        ),

        HorizontalSpaceBox(6.w),

        // Sub-category section
        Icon(
          Icons.style_rounded,
          size: 18.sp,
        ),
        HorizontalSpaceBox(3.w),
        Text(
          accessorySubcategory,
          style: collectionsDetailStyles,
        ),
      ],
    );
  }
}
