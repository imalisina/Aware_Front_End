import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Other packages
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/services/settings/settings_header.dart';

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
              // Settings menu

              // Logout button
            ],
          ),
        ),
      ),
    );
  }
}
