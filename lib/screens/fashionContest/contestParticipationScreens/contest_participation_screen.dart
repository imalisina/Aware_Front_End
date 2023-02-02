import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX packages
import 'package:get/get.dart';
import 'package:sample/components/fashionContest/contestParticipationSection/contest_participation_form.dart';
import 'package:sample/controllers/fashionContest/contest_instructions_controller.dart';

// Other packages
import 'package:sample/packages/title_content.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/packages/navbars/navbar_with_back_button.dart';

class ContestParticipationScreen extends StatelessWidget {
  const ContestParticipationScreen({super.key});

  // Define contest instructions controller
  static final contestInstructionsController =
      Get.put(ContestInstructionsController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(
        navigationBar: navbarWithBackButton,
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VerticalSpaceBox(50.h),

              // Title and sub-title
              TitleContent(
                  "${contestInstructionsController.contestName} contest",
                  "Now it's time to try your chance !"),

              VerticalSpaceBox(40.h),

              // Contest participation form
              const ContestParticipationForm(),
            ],
          ),
        ),
      ),
    );
  }
}
