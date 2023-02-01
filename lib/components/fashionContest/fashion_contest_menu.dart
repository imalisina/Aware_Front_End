import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample/configs/route_names.dart';

// Other packages
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/packages/horizontal_card_button.dart';
import 'package:sample/components/fashionContest/contest_participate_button.dart';

class FashionContestMenu extends StatelessWidget {
  const FashionContestMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: Column(
        children: [
          // Details & instructions section
          const CardContent(
              "Instructions & Rules", Icons.assignment_rounded, ""),

          const Divider(),

          // Awards section
          const CardContent(
              "Awards", Icons.military_tech_rounded, contestAwards),

          VerticalSpaceBox(15.h),

          // Participate button section
          const ContestParticipateButton(),
        ],
      ),
    );
  }
}
