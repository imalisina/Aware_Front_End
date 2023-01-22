import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Other packages
import 'package:sample/packages/slide_text_content.dart';
import 'package:sample/packages/space_box_container.dart';

// Last introduction slide
class IntroductionSlideLast extends StatelessWidget {
  const IntroductionSlideLast({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.maxFinite,
      child: Column(
        children: [
          VerticalSpaceBox(40.h),
          Image.asset(
            "assets/images/last_slide.gif",
            width: 400.w,
            height: 400.h,
          ),
          const TextSlogan("Explore Aware",
              "Become the next fashionista and learn more about fashion by joining to Aware family !")
        ],
      ),
    );
  }
}
