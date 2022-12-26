import 'package:flutter/material.dart';
import 'package:sample/constants/constants.dart';

class IntroductionSlideTwo extends StatelessWidget {
  const IntroductionSlideTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset("assets/images/second_slide.png", height: 250, width: 250,),
      color: SECONDARY_COLOR,
    );
  }
}