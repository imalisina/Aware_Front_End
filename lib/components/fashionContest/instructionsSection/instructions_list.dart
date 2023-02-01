import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/components/fashionContest/instructionsSection/jury_details.dart';

class InstructionsList extends StatelessWidget {
  const InstructionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: Column(
        children: [
          // Instructions and rules section
          const JuryDetails(),
          VerticalSpaceBox(10.h),
        ],
      ),
    );
  }
}
