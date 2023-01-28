import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX package

// Other packages
import 'package:sample/packages/navbars/navbar_without_back_button.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/packages/title_content.dart';
import 'package:sample/screens/completeProfile/personalDetails/personal_details_content.dart';

class PersonalDetailsScreen extends StatelessWidget {
  const PersonalDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(
        navigationBar: navbarWithoutBackButton,
        child: SizedBox(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VerticalSpaceBox(50.h),

                // Title and sub-title
                const TitleContent(
                    "Complete profile", "Enter your personal details"),

                VerticalSpaceBox(40.h),

                // Personal details input fields
                const PersonalDetailsContent(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
