import 'package:flutter/material.dart';
import 'package:sample/constants/constants.dart';
import 'package:sample/screens/Welcome%20Page/Introduction%20Page/IntroductionSlideOne.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'Introduction Page/IntroductionSlideThree.dart';
import 'Introduction Page/IntroductionSlideTwo.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  static List images = [
    "first_slide.png",
    "second_slide.png",
    "third_slide.png"
  ];

  static PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
              IntroductionSlideOne(),
              IntroductionSlideTwo(),
              IntroductionSlideThree(),
            ],
          ),
          Container(
            alignment: Alignment(0, 0.8),
            child: SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: const WormEffect(
                activeDotColor: MAIN_COLOR,
                dotColor: BACKGROUND_COLOR
              ),
            ),
          )
        ],
      )),
    );
  }
}
