import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Other packages
import 'package:sample/utils/slide_text_content.dart';
import 'package:sample/utils/space_box_container.dart';

// Introduction slide one
class IntroductionSlideOne extends StatelessWidget {
  const IntroductionSlideOne({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.maxFinite,
      child: Column(
        children: [

          VerticalSpaceBox(70.h),
          
          // Slide one image
          Image.asset(
            "assets/images/first_slide.gif",
            width: 350.w,
            height: 350.h,
          ),

          VerticalSpaceBox(20.h),
          
          // Title and sub-title
          const TextSlogan("Save Your Time",
              "Aware generates special outfit combos based on your closet for each occasion, people, etc. as fast and best as possible !")
        ],
      ),
    );
  }
}
