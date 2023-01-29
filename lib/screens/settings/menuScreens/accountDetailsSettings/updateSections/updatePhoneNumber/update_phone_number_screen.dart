import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Other packages
import 'package:sample/packages/navbars/navbar_with_back_button.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/packages/title_content.dart';

class UpdatePhoneNumberScreen extends StatelessWidget {
  const UpdatePhoneNumberScreen({super.key});

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
                const TitleContent("Update phone number",
                    "change your account's phone number !"),

                VerticalSpaceBox(20.h),

                // Update phone number content
              ],
            ),
          ),
        ),
      ),
    );
  }
}
