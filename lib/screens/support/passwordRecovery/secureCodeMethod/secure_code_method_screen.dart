import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Other packages
import 'package:sample/packages/navbars/navbar_with_back_button.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/packages/title_content.dart';
import 'package:sample/components/support/passwordRecovery/secureCodeMethod/secure_code_contents.dart';

class SecureCodeMethodScreen extends StatelessWidget {
  const SecureCodeMethodScreen({super.key});

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
              const TitleContent(
                  "Secure Code", "Only copy and paste your Secore Code"),

              VerticalSpaceBox(40.h),

              // Secure code input field and button
              const SecureCodeContents(),
            ],
          ),
        ),
      ),
    );
  }
}
