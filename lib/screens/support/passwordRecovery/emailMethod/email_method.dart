import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// GetX package
import 'package:get/get.dart';

// Other packages
import 'package:sample/configs/theme.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/packages/title_content.dart';
import 'package:sample/screens/support/passwordRecovery/emailMethod/email_method_contents.dart';

class EmailMethod extends StatelessWidget {
  const EmailMethod({super.key});

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
