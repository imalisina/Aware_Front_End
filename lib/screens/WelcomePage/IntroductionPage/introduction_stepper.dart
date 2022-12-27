import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sample/constants/constants.dart';
import 'package:sample/screens/WelcomePage/welcome_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// Introduction slide bullets
class IntroductionStepper extends StatelessWidget {
  // Getting slide controller
  final PageController slideController;
  // ignore: use_key_in_widget_constructors
  const IntroductionStepper(this.slideController);

  // Getting the welcomePageController
  static final welcomeController = Get.put(WelcomePageController());

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: const Alignment(0, 0.88),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Skip button in slider
          CupertinoButton(
            // ignore: prefer_const_constructors
            child: Text(
              "Skip",
              style: const TextStyle(color: SECONDARY_COLOR),
            ),
            onPressed: () {
              // the page number starts from zero
              slideController.jumpToPage(3);
            },
          ),
          // Bullet steps in slider
          SmoothPageIndicator(
            controller: slideController,
            // Number of bullets - based on number of slides
            count: 4,
            effect: const WormEffect(
                activeDotColor: MAIN_COLOR, dotColor: GHOST_COLOR),
          ),
          // Obx state checker to show "Next" or "Done" buttons
          Obx(
            () => !welcomeController.isLastPage.value
                ? CupertinoButton(
                    // ignore: prefer_const_constructors
                    child: Text(
                      "Next",
                      style: const TextStyle(color: MAIN_COLOR),
                    ),
                    onPressed: () {
                      slideController.nextPage(
                          duration: const Duration(milliseconds: 350),
                          curve: Curves.easeIn);
                    },
                  )
                : CupertinoButton(
                    // ignore: prefer_const_constructors
                    child: Text(
                      "Done",
                      style: const TextStyle(
                          color: PRIMARY_COLOR, fontWeight: FontWeight.w700),
                    ),
                    onPressed: () {
                      Get.toNamed("/login");
                    }),
          )
        ],
      ),
    );
  }
}
