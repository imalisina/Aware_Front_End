import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  // Define variables to store password values
  var newPassword = "".obs;
  var newPasswordConfirmation = "".obs;

  // Define variables to handle errors for each input
  var newPassHasError = false.obs;
  var newPassConfirmationHasError = false.obs;

  // Define middleware for redirection
  var hasPermission = false.obs;

  // Define variable to handle loading status
  var spinnerStatus = false.obs;

  // Toggle the spinner status
  void toggleLoading() {
    spinnerStatus.value = !spinnerStatus.value;
  }

  // Store the entered password value
  void storeNewPassword(String enteredPassword) {
    newPassword.value = enteredPassword;
  }

  // Store the repeated password value
  void storeNewPasswordConfirmation(String enteredPasswordConfirmation) {
    newPasswordConfirmation.value = enteredPasswordConfirmation;
  }

  // Validate new password input
  void validatePassword() {
    if (newPassword.value.length < 8 ||
        (GetUtils.isNumericOnly(newPassword.value) ||
            GetUtils.isAlphabetOnly(newPassword.value))) {
      newPassHasError.value = true;
    } else {
      newPassHasError.value = false;
    }
  }

  void validatePasswordConfirmation() {
    if (newPasswordConfirmation.value != newPassword.value) {
      newPassConfirmationHasError.value = true;
    } else {
      newPassConfirmationHasError.value = false;
    }
  }

  // Change the status of redirection middleware
  void setAuthorized() {
    if (newPassHasError.isFalse && newPassConfirmationHasError.isFalse) {
      hasPermission.value = true;
    }
  }
}
