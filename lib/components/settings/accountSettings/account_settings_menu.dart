import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Other packages
import 'package:sample/configs/route_names.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample/packages/horizontal_card_button.dart';

class AccountSettingsMenu extends StatelessWidget {
  const AccountSettingsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: Column(
        children: const [
          // Personal details
          CardContent(
              "Personal details", CupertinoIcons.person_2, personalSettings),

          Divider(),

          // Location details
          CardContent(
              "Location details", CupertinoIcons.placemark, locationSettings),

          Divider(),

          // Change email section
          CardContent("Change account email", CupertinoIcons.at, updateEmail),

          Divider(),

          // Change email section
          CardContent(
              "Change phone number", CupertinoIcons.phone, updatePhoneNumber),
        ],
      ),
    );
  }
}
