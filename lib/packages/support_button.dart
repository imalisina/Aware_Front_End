import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX package
import 'package:get/get.dart';
import 'package:sample/configs/route_names.dart';

class SupportButton extends StatelessWidget {
  const SupportButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CupertinoButton(
          child: Icon(
            Icons.headset_mic_rounded,
            size: 27.w,
          ),
          onPressed: () {
            Get.toNamed(supportMenu);
          }),
    );
  }
}
