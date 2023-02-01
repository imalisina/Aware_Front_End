import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Other packages
import 'package:sample/configs/route_names.dart';
import 'package:sample/packages/horizontal_card_button.dart';

class SupportMenu extends StatelessWidget {
  const SupportMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: Column(
        children: const [
          // Password recovery section
          CardContent(
            "Password recovery",
            Icons.lock_rounded,
            passwordRecovery,
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
