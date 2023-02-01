import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample/components/fashionContest/instructionsSection/instructions_list.dart';

// Other packages
import 'package:sample/packages/title_content.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/packages/navbars/navbar_with_back_button.dart';

class ContestInstructionsScreen extends StatelessWidget {
  const ContestInstructionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(
        navigationBar: navbarWithBackButton,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VerticalSpaceBox(50.h),

              // Title and sub-title
              const TitleContent("Instructions & Rules",
                  "Check all information and rules about the contest"),

              VerticalSpaceBox(40.h),

              // Instructions and rules section
              const InstructionsList(),
            ],
          ),
        ),
      ),
    );
  }
}
