import 'package:get/get.dart';

class NewEmailValidationController extends GetxController {
  // Define variable to store the verification code value
  var verificationCode = "".obs;

  // Define variable to handle errors for verification code input
  var verificationCodeHasError = false.obs;

  // Define middleware for redirection
  var hasPermission = false.obs;

  // Define variable to handle loading status
  var spinnerStatus = false.obs;

  // Toggle the spinner status
  void toggleLoading() {
    spinnerStatus.value = !spinnerStatus.value;
  }

  // Store the entered verification code value
  void storeVerificationCode(String enteredCode) {
    verificationCode.value = enteredCode;
  }

  // Validate verification code input
  void validateVerificationCode() {
    if (verificationCode.value.length != 4 &&
        (!GetUtils.isNumericOnly(verificationCode.value) ||
            !GetUtils.isBlank(verificationCode.value)!)) {
      verificationCodeHasError.value = true;
    } else {
      verificationCodeHasError.value = false;
    }
  }

  // Change the status of redirection middleware
  void setAuthorized() {
    if (verificationCodeHasError.isFalse) {
      hasPermission.value = true;
    }
  }
}
