import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sample/screens/WelcomePage/IntroductionPage/Slides/IntroductionSlideLast.dart';
import 'package:sample/screens/WelcomePage/IntroductionPage/Slides/IntroductionSlideOne.dart';
import 'package:sample/screens/WelcomePage/IntroductionPage/IntroductionStepper.dart';
import 'package:sample/screens/WelcomePage/IntroductionPage/Slides/IntroductionSlideThree.dart';
import 'package:sample/screens/WelcomePage/IntroductionPage/Slides/IntroductionSlideTwo.dart';
import 'package:sample/screens/WelcomePage/WelcomePageController.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  // Setting controller for slider
  static final PageController _controller = PageController();

  // Welcome page controller state
  static final welcomeController = Get.put(WelcomePageController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(
          child: Stack(
        children: [
          PageView(
              controller: _controller,
              onPageChanged: (index) => {
                    if (index == 3) {welcomeController.lastPageSetter()}
                  },
              children: [
                IntroductionSlideOne(),
                IntroductionSlideTwo(),
                IntroductionSlideThree(),
                IntroductionSlideLast()
              ]),
          // Adding stepper - Step bullets
          IntroductionStepper(_controller)
        ],
      )),
    );
  }
}
