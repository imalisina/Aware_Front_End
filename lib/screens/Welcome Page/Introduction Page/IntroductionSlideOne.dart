import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample/constants/constants.dart';

class IntroductionSlideOne extends StatelessWidget {
  const IntroductionSlideOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red[500],
      child: Image.asset(
        "assets/images/first_slide.gif",
        height: 250,
        width: 250,
      ),
    );
  }
}
