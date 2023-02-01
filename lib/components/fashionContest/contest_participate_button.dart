import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Other packages
import 'package:sample/packages/space_box_container.dart';

class ContestParticipateButton extends StatelessWidget {
  const ContestParticipateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton.filled(
      onPressed: () {},
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
