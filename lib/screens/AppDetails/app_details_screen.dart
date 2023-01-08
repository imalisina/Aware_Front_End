import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample/constants/constants.dart';
import 'package:sample/screens/AppDetails/app_details_menu.dart';
import 'package:sample/utils/space_box_container.dart';
import 'package:sample/utils/title_content.dart';

class AppDetailsScreen extends StatelessWidget {
  const AppDetailsScreen({super.key});

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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VerticalSpaceBox(50.h),

              // Title and sub-title
              const TitleContent("For you", "More details about Aware"),

              VerticalSpaceBox(30.h),

              // Details menu
              const AppDetailsMenu(),

              VerticalSpaceBox(50.h),

              // Details image
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/for_you.gif",
                    width: 400.w,
                    height: 400.h,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
