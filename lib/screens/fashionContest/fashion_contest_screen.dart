import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample/components/fashionContest/fashion_contest_menu.dart';

// Other packages
import 'package:sample/packages/title_content.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/packages/navbars/navbar_with_back_button.dart';

class FashionContestScreen extends StatelessWidget {
  const FashionContestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(
        navigationBar: navbarWithBackButton,
        child: SizedBox(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VerticalSpaceBox(50.h),

                // Title and sub-title
                const TitleContent("Fashion contest",
                    "Win more than \$5000, reach to your goals !"),

                VerticalSpaceBox(40.h),

                // Fashion contest menu section
                const FashionContestMenu(),

                VerticalSpaceBox(80.h),

                // Fashion contest image
                Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/fashion_contest.gif",
                    width: 350.w,
                    height: 350.h,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
