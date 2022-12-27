import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample/constants/constants.dart';

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
          middle: Text(
            titleText,
            style: GoogleFonts.pacifico(
                color: MAIN_COLOR,
                fontSize: titleFontSize.sp,
                fontWeight: titleFontWeight),
          ),
        ),
        child: Column(
          children: [
            // PUT OTHER PARTS OF LOGIN PAGE HERE . . .
          ],
        ),
      ),
    );
  }
}
