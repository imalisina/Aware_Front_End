import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample/screens/WelcomePage/IntroductionPage/TextSlogan.dart';
import 'package:sample/utils/SpaceBox.dart';

// Introduction slide three
class IntroductionSlideThree extends StatelessWidget {
  const IntroductionSlideThree({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.maxFinite,
      child: Column(
        children: [
          VerticalSpaceBox(50.h),
          Image.asset(
            "assets/images/third_slide.gif",
            width: 350.w,
            height: 350.h,
          ),
          VerticalSpaceBox(20.h),
          const TextSlogan("Save Your Memories",
              "Write your memories and store them on free and unlimited storage provided by Aware !")
        ],
      ),
    );
  }
}
