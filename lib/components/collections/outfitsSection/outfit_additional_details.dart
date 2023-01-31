import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Other packages
import 'package:sample/configs/theme.dart';
import 'package:sample/packages/space_box_container.dart';

class OutfitAdditionalDetails extends StatelessWidget {
  // Define states to store different values
  final String outfitCategory, outfitCategorySubcategory;
  // Getting props from outfits_list.dart
  // ignore: use_key_in_widget_constructors
  const OutfitAdditionalDetails(
      {required this.outfitCategory, required this.outfitCategorySubcategory});

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
          outfitCategory,
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
          outfitCategorySubcategory,
          style: collectionsDetailStyles,
        ),
      ],
    );
  }
}
