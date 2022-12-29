import 'package:get/get.dart';

class InputFieldController extends GetxController {
  var isPassword = false.obs;

  // To toggle between password's visibility
  togglePassword() {
    isPassword.value = !isPassword.value;
  }
}
