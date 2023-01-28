import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX package

// Other packages
import 'package:sample/packages/navbars/navbar_with_back_button.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/packages/title_content.dart';

class TermsOfUse extends StatelessWidget {
  const TermsOfUse({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: CupertinoPageScaffold(
      navigationBar: navbarWithBackButton,
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
