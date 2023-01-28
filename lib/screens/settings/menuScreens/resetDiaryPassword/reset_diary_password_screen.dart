import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX package
import 'package:get/get.dart';

// Other packages
import 'package:sample/configs/theme.dart';
import 'package:sample/packages/navbars/navbar_with_back_button.dart';
import 'package:sample/packages/title_content.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/services/settings/resetDiaryPassword/reset_diary_password_content.dart';

class ResetDiaryPasswordScreen extends StatelessWidget {
  const ResetDiaryPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(
        navigationBar: navbarWithBackButton,
        child: SizedBox(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VerticalSpaceBox(50.h),

                // Title and sub-title
                const TitleContent(
                    "Diary password", "Reset your diary password"),

                VerticalSpaceBox(40.h),

                // Reset diary password content
                const ResetDiaryPasswordContent(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
