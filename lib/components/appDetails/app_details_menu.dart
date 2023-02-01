import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Other packages
import 'package:sample/configs/route_names.dart';
import 'package:sample/packages/horizontal_card_button.dart';

class AppDetailsMenu extends StatelessWidget {
  const AppDetailsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: Column(
        children: const [
          SizedBox(
            child: CardContent("Terms of use", Icons.help, terms),
          ),
          Divider(),
          SizedBox(
            child: CardContent("Privacy policy", Icons.gavel_rounded, privacy),
          ),
          Divider(),
          SizedBox(
            child: CardContent(
                "User agreement", Icons.handshake_rounded, agreement),
          )
        ],
      ),
    );
  }
}
