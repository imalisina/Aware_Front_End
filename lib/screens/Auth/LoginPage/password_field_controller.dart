import 'package:get/get.dart';

class PasswordFiledController extends GetxController {
  var isPassword = true.obs;

  // To toggle between password's visibility
  togglePassword() {
    isPassword.value = !isPassword.value;
  }
}
