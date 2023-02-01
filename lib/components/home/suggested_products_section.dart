import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Other packages
import 'package:sample/configs/theme.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/components/products/suggestedProducts/suggested_products_list.dart';

class SuggestedProductsSection extends StatelessWidget {
  const SuggestedProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.widgets_rounded,
                color: INPUT_PLACEHOLDER,
                size: 25.sp,
              ),
              HorizontalSpaceBox(2.w),
              Text(
                "Suggested",
                style: sectionTitle,
              ),
            ],
          ),
          VerticalSpaceBox(15.h),
          // Suggested products list section
          const SuggestedProductsList(),
        ],
      ),
    );
  }
}
