import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Other packages
import 'package:sample/packages/title_content.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/packages/navbars/navbar_with_back_button.dart';
import 'package:sample/components/settings/accountSettings/updateSection/UpdatePhoneNumber/new_phone_number_verification_contents.dart';

class UpdatePhoneNumberVerificationScreen extends StatelessWidget {
  const UpdatePhoneNumberVerificationScreen({super.key});

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
                    "Please enter the code sent to your current phone number"),

                VerticalSpaceBox(40.h),

                // Verification input field and button
                const NewPhoneNumberVerificationContents(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
