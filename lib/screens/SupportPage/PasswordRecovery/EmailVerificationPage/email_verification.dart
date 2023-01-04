import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX package
import 'package:get/get.dart';

// Other package
import 'package:google_fonts/google_fonts.dart';
import 'package:sample/constants/constants.dart';
import 'package:sample/screens/SupportPage/PasswordRecovery/EmailVerificationPage/email_verification_contents.dart';
import 'package:sample/utils/space_box_container.dart';
import 'package:sample/utils/title_content.dart';

class EmailVerification extends StatelessWidget {
  const EmailVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: BACKGROUND_COLOR,
          automaticallyImplyLeading: !disableBackButton,
          leading: CupertinoButton(
            padding: EdgeInsets.zero,
            child: Container(
              margin: EdgeInsets.only(top: 10.h),
              child: const Icon(CupertinoIcons.chevron_left),
            ),
            onPressed: () {
              Get.back();
            },
          ),
          border: navigationBorder,
          padding: EdgeInsetsDirectional.only(top: 9.h),
          middle: Text(
            titleText,
            style: GoogleFonts.pacifico(
                color: MAIN_COLOR,
                fontSize: titleFontSize,
                fontWeight: titleFontWeight),
          ),
        ),
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VerticalSpaceBox(50.h),

              // Title and sub-title
              const TitleContent(
                  "Verification", "Please enter the code sent to your email"),

              VerticalSpaceBox(40.h),

              // Verification input field and button
              const EmailVerificationContents(),
            ],
          ),
        ),
      ),
    );
  }
}
