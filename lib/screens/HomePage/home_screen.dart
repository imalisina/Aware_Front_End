import 'package:flutter/cupertino.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: CupertinoPageScaffold(
        child: Center(
          child: Text("Home Page"),
          )
      ),
    );
  }
}