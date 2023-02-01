import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Other packages
import 'package:sample/packages/title_content.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/packages/navbars/navbar_with_back_button.dart';
import 'package:sample/components/fashionContest/awardsSection/award_details_section.dart';

class ContestAwardsScreen extends StatelessWidget {
  const ContestAwardsScreen({super.key});

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
                const TitleContent("Awards",
                    "List of awards for 1st, 2nd, 3rd for this contest"),

                VerticalSpaceBox(40.h),

                // Award details section
                const AwardDetailsSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
