import 'package:flutter/cupertino.dart';

// GetX package
import 'package:get/get.dart';
import 'package:sample/controllers/welcome/welcome_controller.dart';

// Other packages
import 'package:sample/components/welcome/welcome_stepper.dart';
import 'package:sample/components/welcome/slides/welcome_slide_last.dart';
import 'package:sample/components/welcome/slides/welcome_slide_one.dart';
import 'package:sample/components/welcome/slides/welcome_slide_three.dart';
import 'package:sample/components/welcome/slides/welcome_slide_two.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

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
              children: const [
                WelcomeSlideOne(),
                WelcomeSlideTwo(),
                WelcomeSlideThree(),
                WelcomeSlideLast(),
              ],
            ),
            // Adding stepper - Step bullets
            WelcomeStepper(_controller),
          ],
        ),
      ),
    );
  }
}
