import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample/constants/constants.dart';
import 'package:sample/screens/Welcome%20Page/Controllers/WelcomeController.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final welcomeData = Get.put(WelcomeController());

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: Container(
        width: 300,
        height: 400,
        decoration: BoxDecoration(color: BACKGROUND_COLOR),
        child: Center(
          child: Text("${welcomeData.msg}"),
        ),
      ),
    ));
  }
}
