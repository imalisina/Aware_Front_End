import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Other packages
import 'package:sample/packages/navbars/navbar_with_back_button.dart';
import 'package:sample/screens/appDetails/app_details_menu.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/packages/title_content.dart';

class AppDetailsScreen extends StatelessWidget {
  const AppDetailsScreen({super.key});

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
              const TitleContent("For you", "More details about Aware"),

              VerticalSpaceBox(30.h),

              // Details menu
              const AppDetailsMenu(),

              VerticalSpaceBox(50.h),

              // Details image
              Container(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/images/for_you.gif",
                  width: 400.w,
                  height: 400.h,
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
