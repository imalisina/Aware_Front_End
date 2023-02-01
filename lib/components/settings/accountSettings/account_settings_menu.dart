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
              "Personal details", Icons.group_rounded, personalSettings),

          Divider(),

          // Location details
          CardContent(
              "Location details", Icons.location_on_rounded, locationSettings),

          Divider(),

          // Change email section
          CardContent("Change account email", Icons.email_rounded, updateEmail),

          Divider(),

          // Change email section
          CardContent(
              "Change phone number", Icons.phone_rounded, updatePhoneNumber),
        ],
      ),
    );
  }
}
