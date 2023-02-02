import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Other packages
import 'package:sample/components/fashionContest/instructionsSection/contest_instructions_container.dart';

class InstructionsList extends StatelessWidget {
  const InstructionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: const ContestInstructionsContainer(),
    );
  }
}
