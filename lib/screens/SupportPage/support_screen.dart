import 'package:flutter/cupertino.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: CupertinoPageScaffold(
        child: Center(
          child: Text("Support screen"),
        ),
      ),
    );
  }
}
