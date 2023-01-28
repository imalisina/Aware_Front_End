import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Other packages
import 'package:sample/packages/slide_text_content.dart';
import 'package:sample/packages/space_box_container.dart';

// Introduction slide two
class WelcomeSlideTwo extends StatelessWidget {
  const WelcomeSlideTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.maxFinite,
      child: Column(
        children: [
          VerticalSpaceBox(40.h),
          Image.asset(
            "assets/images/second_slide.gif",
            width: 400.w,
            height: 400.h,
          ),
          const TextSlogan("Next Beauty Pageant",
              "You can participate on Aware online fashion contests to win valuable awards !")
        ],
      ),
    );
  }
}
