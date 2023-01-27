import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample/configs/route_names.dart';

// Other packages
import 'package:sample/packages/horizontal_card_button.dart';

class PasswordRecoveryMenu extends StatelessWidget {
  const PasswordRecoveryMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: Column(
        children: const [
          SizedBox(
            child: CardContent(
                "Secure Code", CupertinoIcons.lock_shield, secureCode),
          ),
          Divider(),
          SizedBox(
            child: CardContent(
                "Email verification code", CupertinoIcons.mail, emailMethod),
          ),
        ],
      ),
    );
  }
}
