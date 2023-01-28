import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Other packages
import 'package:sample/packages/navbars/navbar_with_back_button.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/packages/title_content.dart';
import 'package:sample/services/settings/personalSettings/personal_settings_content.dart';

class PersonalSettingsScreen extends StatelessWidget {
  const PersonalSettingsScreen({super.key});

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
            const TitleContent(
                "Personal details", "Check and edit your personal details !"),

            VerticalSpaceBox(20.h),

            // Personal settings content
            const PersonalSettingsContent(),
          ],
        ),
      ),
    ));
  }
}
