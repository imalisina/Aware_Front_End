import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX package

// Other packages
import 'package:sample/packages/navbars/navbar_with_back_button.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/packages/title_content.dart';
import 'package:sample/components/support/passwordRecovery/emailMethod/email_method_contents.dart';

class EmailMethodScreen extends StatelessWidget {
  const EmailMethodScreen({super.key});

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
              const TitleContent("Email", "Please enter your account's email"),

              VerticalSpaceBox(40.h),

              // Email input field and button
              const EmailMethodContents(),
            ],
          ),
        ),
      ),
    );
  }
}
