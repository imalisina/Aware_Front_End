import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// GetX package
import 'package:get/get.dart';

// Other packages
import 'package:sample/configs/theme.dart';
import 'package:sample/packages/navbars/navbar_with_back_button.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/packages/title_content.dart';
import 'package:sample/screens/support/passwordRecovery/password_recovery_menu.dart';

class PasswordRecoveryScreen extends StatelessWidget {
  const PasswordRecoveryScreen({super.key});

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
                  "Password recovery", "Please select one recovery method"),

              VerticalSpaceBox(40.h),

              // Password recovery menu
              const PasswordRecoveryMenu(),

              VerticalSpaceBox(100.h),

              // Password recovery image
              Container(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/images/security.gif",
                  width: 400.w,
                  height: 400.h,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
