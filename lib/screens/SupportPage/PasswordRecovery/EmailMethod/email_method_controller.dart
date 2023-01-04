import 'package:get/get.dart';

class EmailMethodController extends GetxController {
  // Define variable to store the email value
  var email = "".obs;

  // Define variable to handle errors for email input
  var emailHasError = false.obs;

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

  // Validate email input
  void validateEmail() {
    if (!GetUtils.isEmail(email.value)) {
      emailHasError.value = true;
    } else {
      emailHasError.value = false;
    }
  }

  // Change the status of redirection middleware
  void setAuthorized() {
    if (emailHasError.isFalse) {
      hasPermission.value = true;
    }
  }
}
