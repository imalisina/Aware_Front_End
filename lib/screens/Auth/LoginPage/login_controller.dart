import 'package:get/get.dart';

class LoginController extends GetxController {
  // Define variables to store input values
  var email = "".obs;
  var password = "".obs;

  // Define variables to handle errors for each input
  var emailHasError = false.obs;
  var passwordHasError = false.obs;

  // Define middleware for redirection
  var hasPermission = false.obs;

  // Store the entered email value
  void storeEmail(String enteredEmail) {
    email.value = enteredEmail;
  }

  // Store the entered password value
  void storePassword(String enteredPassword) {
    password.value = enteredPassword;
  }

  // Validate email input
  void validateEmail() {
    if (!GetUtils.isEmail(email.value)) {
      emailHasError.value = true;
    } else {
      emailHasError.value = false;
    }
  }

  // Validate password input
  void validatePassword() {
    if (password.value.length < 8) {
      passwordHasError.value = true;
    } else {
      passwordHasError.value = false;
    }
  }

  // Change the status of redirection middleware
  void setAuthorized() {
    if (emailHasError.isFalse && passwordHasError.isFalse) {
      hasPermission.value = true;
    }
  }
}
