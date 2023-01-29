import 'package:get/get.dart';

class UpdatePhoneNumberController extends GetxController {
  // Define variable to store the phone number value
  var phoneNumber = "".obs;

  // Define a variable to store the current phone number
  var currentPhoneNumber = "+95913819944".obs;

  // Define variable to handle errors for phone number input
  var phoneNumberHasError = false.obs;

  // Define middleware for redirection
  var hasPermission = false.obs;

  // Define variable to handle loading status
  var spinnerStatus = false.obs;

  // Toggle the spinner status
  void toggleLoading() {
    spinnerStatus.value = !spinnerStatus.value;
  }

  // Store the entered phone number value
  void storePhoneNumber(String enteredPhoneNumber) {
    phoneNumber.value = enteredPhoneNumber;
  }

  // Method to update the phone number
  void updatePhoneNumber() {
    currentPhoneNumber.value = phoneNumber.value;
  }

  // Validate phone number input
  void validatePhoneNumber() {
    if (!GetUtils.isPhoneNumber(phoneNumber.value)) {
      phoneNumberHasError.value = true;
    } else {
      phoneNumberHasError.value = false;
    }
  }

  // Change the status of redirection middleware
  void setAuthorized() {
    if (phoneNumberHasError.isFalse) {
      hasPermission.value = true;
    }
  }
}
