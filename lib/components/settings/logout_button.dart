import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Other packages
import 'package:sample/packages/space_box_container.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton.filled(
      onPressed: () {},
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Logout"),
          HorizontalSpaceBox(10.h),
          const Icon(Icons.power_settings_new_rounded),
        ],
      ),
    );
  }
}
