import 'package:flutter/material.dart';
import 'package:sample/constants/constants.dart';

class IntroductionSlideOne extends StatelessWidget {
  const IntroductionSlideOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: Image.asset("assets/images/first_slide.png", height: 250, width: 250,),
    );
  }
}