import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Other packages
import 'package:sample/configs/theme.dart';

// Navigation without back button
ObstructingPreferredSizeWidget? navbarWithoutBackButton =
    CupertinoNavigationBar(
  backgroundColor: BACKGROUND_COLOR,
  automaticallyImplyLeading: disableBackButton,
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
