import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample/configs/theme.dart';

// Other packages
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/screens/home/components/middle_box_section.dart';
import 'package:sample/screens/home/components/need_combination_section.dart';
import 'package:sample/screens/home/components/suggested_products_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(
        child: SingleChildScrollView(
          child: Container(
            width: 500.w,
            padding: EdgeInsets.only(bottom: 20.h, left: 15.w, right: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                VerticalSpaceBox(30.h),

                // Need Combination section
                const NeedCombinationSection(),

                VerticalSpaceBox(30.h),

                // Middle boxes section - Daily Quote : Discover Discounts : My Bookmarks
                const MiddleBoxSection(),

                VerticalSpaceBox(30.h),

                // Suggested Products section - Slider
                const SuggestedProductsSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
