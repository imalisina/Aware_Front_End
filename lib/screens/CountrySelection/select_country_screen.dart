import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample/constants/constants.dart';
import 'package:sample/screens/CountrySelection/country_selection_content.dart';

// Country selection page container
class SelectCountry extends StatelessWidget {
  const SelectCountry({super.key});

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
          child: CountrySelectionContent()),
    );
  }
}
