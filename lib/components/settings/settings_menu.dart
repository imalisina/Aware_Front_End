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
            Icons.manage_accounts_rounded,
            accountSettings,
          ),

          Divider(),

          // Password recovery section
          CardContent(
            "Password recovery",
            Icons.lock_rounded,
            passwordRecovery,
          ),

          Divider(),

          // Diary settings
          CardContent(
            "Reset diary password",
            Icons.password_rounded,
            resetDiaryPassword,
          ),

          Divider(),

          // Secure code section
          CardContent(
            "Get Secure code",
            Icons.security_rounded,
            getSecureCode,
          ),

          Divider(),

          // Contact us section
          CardContent(
            "Contact us",
            Icons.headset_rounded,
            contactUs,
          ),
        ],
      ),
    );
  }
}
