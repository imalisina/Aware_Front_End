import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX packages

// Other packages
import 'package:sample/packages/navbars/navbar_with_back_button.dart';
import 'package:sample/packages/title_content.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/services/settings/getSecureCodeSection/get_secure_code_content.dart';

class GetSecureCodeScreen extends StatelessWidget {
  const GetSecureCodeScreen({super.key});

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
                  "Get Secure code", "a useful code for account recovery !"),

              VerticalSpaceBox(40.h),

              // Get secure code content
              const GetSecureCodeContent(),

              VerticalSpaceBox(100.h),

              // Get secure code image
              Container(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/images/get_secure_code.gif",
                  width: 350.w,
                  height: 350.h,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
