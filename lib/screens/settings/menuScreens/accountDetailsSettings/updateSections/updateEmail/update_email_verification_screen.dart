import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Other packages
import 'package:sample/packages/title_content.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/packages/navbars/navbar_with_back_button.dart';
import 'package:sample/components/settings/accountSettings/updateSection/updateEmail/new_email_verification_contents.dart';

class UpdateEmailVerificationScreen extends StatelessWidget {
  const UpdateEmailVerificationScreen({super.key});

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
                const TitleContent("Verification",
                    "Please enter the code sent to your current email"),

                VerticalSpaceBox(40.h),

                // Verification input field and button
                const NewEmailVerificationContents(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
