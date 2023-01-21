import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// Other packages
import 'package:sample/constants/constants.dart';
import 'package:sample/utils/space_box_container.dart';
import 'package:sample/screens/HomePage/Components/need_combination_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: BACKGROUND_COLOR,
          automaticallyImplyLeading: disableBackButton,
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
          width: 500.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              VerticalSpaceBox(30.h),

              // Need Combination section
              const NeedCombinationSection(),

              // VerticalSpaceBox(10.h),
            ],
          ),
        ),
      ),
    );
  }
}
