import 'package:get/get.dart';

class PasswordFiledController extends GetxController {
  var isPassword = true.obs;
  bool secureSection = true;

  // To toggle between password's visibility
  void togglePassword() {
    isPassword.value = !isPassword.value;
  }
}
