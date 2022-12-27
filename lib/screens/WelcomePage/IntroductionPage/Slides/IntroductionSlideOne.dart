import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample/screens/WelcomePage/IntroductionPage/TextSlogan.dart';
import 'package:sample/utils/SpaceBox.dart';

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
          Image.asset(
            "assets/images/first_slide.gif",
            width: 350.w,
            height: 350.h,
          ),
          VerticalSpaceBox(20.h),
          const TextSlogan("Save Your Time",
              "Aware generates special outfit combos based on your closet for each occasion, people, etc. as fast and best as possible !")
        ],
      ),
    );
  }
}
