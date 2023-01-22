import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// GetX package
import 'package:get/get.dart';

// Other packages
import 'package:sample/configs/theme.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/packages/title_content.dart';
import 'package:sample/screens/support/support_menu.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

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
                  "Need Help ?", "Please select one support option"),

              VerticalSpaceBox(40.h),

              // Support menu
              const SupportMenu(),

              VerticalSpaceBox(100.h),

              // Support image
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/support.gif",
                    width: 400.w,
                    height: 400.h,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
