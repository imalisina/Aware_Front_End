import 'package:flutter/cupertino.dart';
import 'package:sample/constants/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Stepper extends StatelessWidget {
  final PageController detail;
  const Stepper(this.detail);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(0, 0.8),
      child: SmoothPageIndicator(
        controller: detail,
        count: 3,
        effect: const WormEffect(
            activeDotColor: MAIN_COLOR, dotColor: BACKGROUND_COLOR),
      ),
    );
  }
}
