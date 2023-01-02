import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX package
import 'package:get/get.dart';

class SupportButton extends StatelessWidget {
  const SupportButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CupertinoButton(
          child: Icon(
            CupertinoIcons.headphones,
            size: 27.w,
          ),
          onPressed: () {
            Get.toNamed("/support/menu");
          }),
    );
  }
}
