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
            "Account details",
            // CupertinoIcons.doc_person,
            CupertinoIcons.person,
            accountSettings,
          ),

          Divider(),

          // Password recovery section
          CardContent(
            "Password recovery",
            CupertinoIcons.lock_open,
            passwordRecovery,
          ),

          Divider(),

          // Diary settings
          CardContent(
            "Reset diary password",
            CupertinoIcons.pencil_ellipsis_rectangle,
            resetDiaryPassword,
          ),

          Divider(),

          // Secure code section
          CardContent("Get Secure code", CupertinoIcons.burst, getSecureCode),

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
