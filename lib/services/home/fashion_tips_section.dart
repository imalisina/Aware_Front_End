import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample/configs/theme.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/services/fashionTips/fashion_tips_list.dart';

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
                CupertinoIcons.square_favorites,
                color: INPUT_PLACEHOLDER,
                size: 25.sp,
              ),
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
