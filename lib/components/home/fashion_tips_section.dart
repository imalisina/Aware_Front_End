import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample/configs/theme.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/components/fashionTips/fashion_tips_list.dart';

class FashionTipsSection extends StatelessWidget {
  const FashionTipsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.fact_check_rounded,
                color: INPUT_PLACEHOLDER,
                size: 25.sp,
              ),
              HorizontalSpaceBox(3.w),
              Text(
                "Fashion Tips",
                style: sectionTitle,
              ),
            ],
          ),
          VerticalSpaceBox(15.h),
          // Fashion Tips list section
          const FashionTipsList(),
        ],
      ),
    );
  }
}
