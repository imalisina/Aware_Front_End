import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Other packages
import 'package:sample/configs/route_names.dart';
import 'package:sample/packages/horizontal_card_button.dart';

class SettingsMenu extends StatelessWidget {
  const SettingsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: const [
          // Account details section
          CardContent(
            "Personal details",
            // CupertinoIcons.doc_person,
            CupertinoIcons.person_2_square_stack,
            "",
          ),

          Divider(),

          // Location details section
          CardContent(
            "Location details",
            CupertinoIcons.placemark,
            "",
          ),

          Divider(),

          // Password recovery section
          CardContent(
            "Password recovery",
            CupertinoIcons.lock_rotation,
            passwordRecovery,
          ),

          Divider(),

          // Diary settings
          CardContent(
            "Diary settings",
            CupertinoIcons.pencil_ellipsis_rectangle,
            "",
          ),

          Divider(),

          // Secure code section
          CardContent("Get Secure code", CupertinoIcons.burn, getSecureCode),

          Divider(),

          // Contact us section
          CardContent(
            "Contact us",
            CupertinoIcons.text_bubble,
            contactUs,
          ),
        ],
      ),
    );
  }
}
