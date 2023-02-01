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
                const TitleContent(
                    "Fashion contest", "Reach to your goals, become famous !"),

                VerticalSpaceBox(40.h),

                // Fashion contest menu section
                const FashionContestMenu(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
