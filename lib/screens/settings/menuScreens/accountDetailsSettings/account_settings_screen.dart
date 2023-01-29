import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Other packages
import 'package:sample/packages/title_content.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/packages/navbars/navbar_with_back_button.dart';
import 'package:sample/components/settings/accountSettings/account_settings_menu.dart';

class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({super.key});

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
              const TitleContent(
                  "Account details", "Check and update your details !"),

              VerticalSpaceBox(40.h),

              // Account details menu
              const AccountSettingsMenu(),

              VerticalSpaceBox(100.h),

              // Account details image
              Container(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/images/account_settings.gif",
                  width: 400.w,
                  height: 400.h,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
