import 'package:get/get.dart';

class UpdateEmailController extends GetxController {
  // Define variable to store the email value
  var email = "".obs;

  // Define a variable to store the current email
  var currentEmail = "callertracy@gmail.com".obs;

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

  // Method to update the email
  void updateEmail() {
    currentEmail.value = email.value;
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
