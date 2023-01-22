import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample/configs/theme.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/services/suggestedProducts/suggested_products_list.dart';

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
                CupertinoIcons.square_favorites_alt_fill,
                color: INPUT_PLACEHOLDER,
                size: 25.sp,
              ),
              Text(
                "Suggested",
                style: sectionTitle,
              ),
            ],
          ),
          VerticalSpaceBox(15.h),
          const SuggestedProductsList(),
        ],
      ),
    );
  }
}
