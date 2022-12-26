import 'package:flutter/material.dart';
import 'package:sample/constants/constants.dart';

class IntroductionSlideThree extends StatelessWidget {
  const IntroductionSlideThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset("assets/images/third_slide.png", height: 250, width: 250,),
      color: PRIMARY_COLOR,
    );
  }
}