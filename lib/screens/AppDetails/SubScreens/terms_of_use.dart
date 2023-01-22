import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// GetX package
import 'package:get/get.dart';

// Other packages
import 'package:sample/configs/theme.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/packages/title_content.dart';

class TermsOfUse extends StatelessWidget {
  const TermsOfUse({super.key});

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
            const TitleContent("Terms of use", "You can check our conditions"),

            VerticalSpaceBox(40.h),

            // Main content
            Container(
              margin: EdgeInsets.only(left: 30.w, right: 30.w),
              child: const Text("PUT REAL TERMS AND CONDITIONS"),
            )
          ],
        ),
      ),
    ));
  }
}
