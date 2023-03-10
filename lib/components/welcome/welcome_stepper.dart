import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample/configs/route_names.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// GetX package
import 'package:get/get.dart';
import 'package:sample/controllers/welcome/welcome_controller.dart';

// Other packages
import 'package:sample/configs/theme.dart';

// Introduction slide bullets
class WelcomeStepper extends StatelessWidget {
  // Getting slide controller
  final PageController slideController;
  // ignore: use_key_in_widget_constructors
  const WelcomeStepper(this.slideController);

  // Getting the welcomePageController
  static final welcomeController = Get.put(WelcomePageController());

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(0, 0.88.h),
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
                      Get.toNamed(countrySelection);
                    }),
          )
        ],
      ),
    );
  }
}
