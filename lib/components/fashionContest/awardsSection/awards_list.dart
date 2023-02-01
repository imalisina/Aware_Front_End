import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Other packages
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/components/fashionContest/awardsSection/first_winner_award_details.dart';
import 'package:sample/components/fashionContest/awardsSection/third_winner_award_details.dart';
import 'package:sample/components/fashionContest/awardsSection/second_winner_award_details.dart';

class AwardsList extends StatelessWidget {
  const AwardsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      height: 600.h,
      child: Column(
        children: [
          // First winner award details section
          const FirstWinnerAwardDetails(),
          VerticalSpaceBox(10.h),
          const SecondWinnerAwardDetails(),
          VerticalSpaceBox(10.h),
          const ThirdWinnerAwardDetails(),
        ],
      ),
    );
  }
}
