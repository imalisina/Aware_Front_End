import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample/configs/route_names.dart';

// Other packages
import 'package:sample/packages/horizontal_card_button.dart';

class SupportMenu extends StatelessWidget {
  const SupportMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: Column(
        children: const [
          SizedBox(
            child: CardContent("Password Recovery",
                CupertinoIcons.lock_rotation, passwordRecovery),
          ),
          Divider(),
          SizedBox(
            child: CardContent(
                "Contact us", CupertinoIcons.text_bubble, contactUs),
          ),
        ],
      ),
    );
  }
}
