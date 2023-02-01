import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX package
import 'package:get/get.dart';

// Other package
import 'package:sample/configs/route_names.dart';

// Other packages
import 'package:sample/configs/theme.dart';

// Navigation with fashion contest button
ObstructingPreferredSizeWidget? mainScreenNavbar = CupertinoNavigationBar(
  backgroundColor: BACKGROUND_COLOR,
  automaticallyImplyLeading: !disableBackButton,
  trailing: CupertinoButton(
    padding: EdgeInsets.zero,
    child: Container(
      margin: EdgeInsets.only(top: 10.h, right: 15.w),
      child: AvatarGlow(
        endRadius: 15.r,
        glowColor: MAIN_COLOR,
        child: Icon(
          Icons.whatshot_rounded,
          color: PRIMARY_COLOR,
          size: 30.sp,
        ),
      ),
    ),
    onPressed: () {
      Get.toNamed(fashionContest);
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
