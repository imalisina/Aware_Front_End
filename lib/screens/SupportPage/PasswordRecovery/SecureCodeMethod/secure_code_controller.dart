import 'package:get/get.dart';

class SecureCodeController extends GetxController {
  // Define variable to store the input value
  var email = "".obs;
  var secureCode = "".obs;

  // Define variable to handle errors for each input
  var emailHasError = false.obs;
  var secureCodeHasError = false.obs;

  // Define middleware for redirection
  var hasPermission = false.obs;

  // Define variable to handle loading status
  var spinnerStatus = false.obs;

  // Toggle the spinner status
  void toggleLoading() {
    spinnerStatus.value = !spinnerStatus.value;
  }

  // Store the entered email value
  void storeEmail(String enteredEmail) {
    email.value = enteredEmail;
  }

  // Store the entered Secure Code value
  void storeSecureCode(String enteredCode) {
    secureCode.value = enteredCode;
  }

  // Validate email input
  void validateEmail() {
    if (!GetUtils.isEmail(email.value)) {
      emailHasError.value = true;
    } else {
      emailHasError.value = false;
    }
  }

  // Validate Secure Code input with API
  void validateSecureCode() {
    if (secureCode.value.length != 10 || secureCode.value.isEmpty) {
      secureCodeHasError.value = true;
    } else {
      secureCodeHasError.value = false;
    }
  }

  // Change the status of redirection middleware
  void setAuthorized() {
    if (secureCodeHasError.isFalse && emailHasError.isFalse) {
      hasPermission.value = true;
    }
  }
}
