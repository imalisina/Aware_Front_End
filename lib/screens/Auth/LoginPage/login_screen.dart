import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample/constants/constants.dart';
import 'package:sample/screens/Auth/LoginPage/LoginForm/login_contents.dart';
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
          padding: EdgeInsetsDirectional.only(top: 9.0.h),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VerticalSpaceBox(25.h),
              const TitleContent(
                  "Login", "Login to your existing Aware account"),
              VerticalSpaceBox(30.h),
              const LoginContents(),
            ],
          ),
        ),
      ),
    );
  }
}
