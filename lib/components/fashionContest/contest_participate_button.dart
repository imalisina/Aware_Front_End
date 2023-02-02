import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX package
import 'package:get/get.dart';

// Other packages
import 'package:sample/configs/route_names.dart';
import 'package:sample/packages/space_box_container.dart';

class ContestParticipateButton extends StatelessWidget {
  const ContestParticipateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton.filled(
      // Redirect to participation screen
      onPressed: () {
        Get.toNamed(participate);
      },
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Participate"),
          HorizontalSpaceBox(10.h),
          const Icon(Icons.sports_rounded),
        ],
      ),
    );
  }
}
