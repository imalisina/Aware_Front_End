import 'package:flutter/cupertino.dart';
import 'package:sample/screens/Welcome%20Page/Introduction%20Page/IntroductionSlideOne.dart';
import 'package:sample/screens/Welcome%20Page/Introduction%20Page/Stepper.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});
  static PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(
          child: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
              IntroductionSlideOne(),
            ],
          ),
          Stepper(_controller)
        ],
      )),
    );
  }
}
