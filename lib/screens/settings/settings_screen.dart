import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Other packages
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/components/settings/logout_button.dart';
import 'package:sample/components/settings/settings_header.dart';
import 'package:sample/components/settings/settings_menu.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(
        child: Container(
          width: 500.w,
          padding: EdgeInsets.only(bottom: 20.h, left: 20.w, right: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VerticalSpaceBox(30.h),

              // Settings header
              const SettingsHeader(),

              VerticalSpaceBox(40.h),

              // Settings menu
              const SettingsMenu(),

              VerticalSpaceBox(15.h),

              // Logout button
              const LogoutButton(),

              VerticalSpaceBox(25.h),

              // Aware transparent logo
              Container(
                alignment: Alignment.center,
                child: Opacity(
                  opacity: 0.2,
                  child: Image.asset(
                    "assets/images/aware_logo.png",
                    width: 40.w,
                    height: 40.h,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
