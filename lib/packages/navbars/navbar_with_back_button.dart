import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX packages
import 'package:get/get.dart';

// Other packages
import 'package:sample/configs/theme.dart';

// Navigation with back button
ObstructingPreferredSizeWidget? navbarWithBackButton = CupertinoNavigationBar(
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
      fontWeight: titleFontWeight,
    ),
  ),
);