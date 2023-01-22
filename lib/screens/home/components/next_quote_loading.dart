import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Other packages
import 'package:sample/configs/color_palette.dart';
import 'package:sample/packages/space_box_container.dart';

class NextQuoteLoading extends StatelessWidget {
  const NextQuoteLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          CupertinoActivityIndicator(radius: 15.r),
          VerticalSpaceBox(10.h),
          const Text(
            "Check the Daily Quote in the next 24 hours",
            textAlign: TextAlign.center,
            style: TextStyle(color: SECONDARY_COLOR),
          ),
        ],
      ),
    );
  }
}
