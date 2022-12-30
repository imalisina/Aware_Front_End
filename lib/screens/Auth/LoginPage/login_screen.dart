import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// Other packages
import 'package:sample/constants/constants.dart';
import 'package:sample/screens/Auth/LoginPage/login_contents.dart';
import 'package:sample/screens/Auth/LoginPage/social_media_login.dart';
import 'package:sample/screens/Auth/LoginPage/support_button.dart';
import 'package:sample/screens/Auth/title_content.dart';
import 'package:sample/utils/space_box_container.dart';

// Login page container
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: BACKGROUND_COLOR,
          automaticallyImplyLeading: enabledBackButton,
          border: navigationBorder,
          padding: EdgeInsetsDirectional.only(top: 9.h),
          middle: Text(
            titleText,
            style: GoogleFonts.pacifico(
                color: MAIN_COLOR,
                fontSize: titleFontSize.sp,
                fontWeight: titleFontWeight),
          ),
        ),
        // ignore: prefer_const_literals_to_create_immutables
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
