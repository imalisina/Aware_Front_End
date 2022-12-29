import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  // Define a global key for login form
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  // Define Text controller for each input - Email and password
  late TextEditingController emailController, passwordController;
  // Declare two variables to store the value of each input
  var email = "";
  var password = "";

  // Create an instances of TextEditingController
  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  // Dispose the controllers
  // @override
  // void onClose() {
  //   emailController.dispose();
  //   passwordController.dispose();
  // }

  // Validate the entered email
  void validateEmail() {
    if (!GetUtils.isEmail(email)) {
      print("invalid email!");
    } else {
      print("THANKS");
    }
  }

  // Validate the entered password
  void validatePassword() {
    if (password.length < 8) {
      print("invalid password");
    } else {
      print("THANKS FOR PASSWORD");
    }
  }

  // Perform the login operation
  void performLogin() {
    loginFormKey.currentState!.save();
    print(email);
    print(password);
  }
}
