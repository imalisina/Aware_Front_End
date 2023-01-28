import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Other packages
import 'package:sample/packages/navbars/navbar_without_back_button.dart';
import 'package:sample/packages/support_button.dart';
import 'package:sample/packages/title_content.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/services/auth/login/login_contents.dart';
import 'package:sample/services/auth/login/social_media_login.dart';

// Login page container
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                    "Login", "Login to your existing Aware account"),

                VerticalSpaceBox(40.h),

                // Login input fields and button
                const LoginContents(),

                VerticalSpaceBox(30.h),

                // Social media login options
                const SocialMediaLogin(),

                // Support Icon
                const SupportButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
