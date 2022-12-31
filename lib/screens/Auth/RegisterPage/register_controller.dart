import 'package:get/get.dart';

class RegisterController extends GetxController {
  // Define variables to store input values
  var name = "".obs;
  var email = "".obs;
  var phoneNumber = "".obs;
  var password = "".obs;

  // Define variables to handle errors for each input
  var nameHasError = false.obs;
  var emailHasError = false.obs;
  var phoneNumberHasError = false.obs;
  var passwordHasError = false.obs;

  // Define middleware for redirection
  var hasPermission = false.obs;

  // Store the entered name value
  void storeName(String enteredName) {
    name.value = enteredName;
  }

  // Store the entered email value
  void storeEmail(String enteredEmail) {
    email.value = enteredEmail;
  }

  // Store the entered phone number value
  void storePhoneNumber(String enteredPhoneNumber) {
    phoneNumber.value = enteredPhoneNumber;
  }

  // Store the entered password value
  void storePassword(String enteredPassword) {
    password.value = enteredPassword;
  }

  // Validate name input
  void validateName() {
    if (name.value.length < 5 && !GetUtils.isAlphabetOnly(name.value)) {
      nameHasError.value = true;
    } else {
      nameHasError.value = false;
    }
  }

  // Validate email input
  void validateEmail() {
    if (!GetUtils.isEmail(email.value)) {
      emailHasError.value = true;
    } else {
      emailHasError.value = false;
    }
  }

  // Validate phone number input
  void validatePhoneNumber() {
    if (!GetUtils.isPhoneNumber(phoneNumber.value)) {
      phoneNumberHasError.value = true;
    } else {
      phoneNumberHasError.value = false;
    }
  }

  // Validate password input
  void validatePassword() {
    if (password.value.length < 8 ||
        (GetUtils.isNumericOnly(password.value) ||
            GetUtils.isAlphabetOnly(password.value))) {
      passwordHasError.value = true;
    } else {
      passwordHasError.value = false;
    }
  }

  // Change the status of redirection middleware
  void setAuthorized() {
    if (nameHasError.isFalse &&
        emailHasError.isFalse &&
        phoneNumberHasError.isFalse &&
        passwordHasError.isFalse) {
      hasPermission.value = true;
    }
  }
}
