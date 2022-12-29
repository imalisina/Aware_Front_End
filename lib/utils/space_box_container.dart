import 'package:flutter/cupertino.dart';

class VerticalSpaceBox extends StatelessWidget {
  // Define height
  final double height;
  // Getting state from other components
  // ignore: use_key_in_widget_constructors
  const VerticalSpaceBox(this.height);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}

class HorizontalSpaceBox extends StatelessWidget {
  // Define height
  final double width;
  // Getting state from other components
  // ignore: use_key_in_widget_constructors
  const HorizontalSpaceBox(this.width);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width);
  }
}