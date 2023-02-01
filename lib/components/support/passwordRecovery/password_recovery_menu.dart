import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Other packages
import 'package:sample/configs/route_names.dart';
import 'package:sample/packages/horizontal_card_button.dart';

class PasswordRecoveryMenu extends StatelessWidget {
  const PasswordRecoveryMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: Column(
        children: const [
          // Secure code method
          CardContent("Secure Code", Icons.vpn_key_rounded, secureCode),

          Divider(),

          // Email method
          CardContent(
              "Email verification code", Icons.mail_lock_rounded, emailMethod),
        ],
      ),
    );
  }
}
