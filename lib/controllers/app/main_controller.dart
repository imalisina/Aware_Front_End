import 'package:get/get.dart';
// Login and Register controllers
import 'package:sample/controllers/auth/login/login_controller.dart';
import 'package:sample/controllers/auth/register/register_controller.dart';

class MainController extends GetxController {
  // Define a variable to check whether user is authorized or not
  var isAuthenticated = false.obs;

  // Define a variable to store the status of user permission in LOGIN
  var permittedInLogin = LoginController().hasPermission;
  // Define a variable to store the status of user permission in REGISTER
  var permittedInRegister = RegisterController().hasPermission;

  // Method to change the status of isAuthenticated variable
  void setAuthenticated() {
    if (permittedInLogin.isTrue || permittedInRegister.isTrue) {
      isAuthenticated.value = true;
    } else {
      isAuthenticated.value = false;
    }
  }
}
