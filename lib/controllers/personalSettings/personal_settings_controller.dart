import 'package:get/get.dart';

class PersonalSettingsController extends GetxController {
  // GETTING BASIC INPUTS --> FULLNAME | EMAIL | PHONE NUMBER
  // Define variables to store input values
  var name = "Martin".obs;
  var email = "mar@gmail.com".obs;
  var phoneNumber = "+9481939139".obs;

  // Define variables to handle errors for each input
  var nameHasError = false.obs;
  var emailHasError = false.obs;
  var phoneNumberHasError = false.obs;

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

  // BIRTH DATE INPUT SECTION
  // Define initial value for Date Time in Modal
  var defaultDate = DateTime.now();
  // Define variable to store the birthdate
  var birthYear = 0.obs;
  var birthMonth = 0.obs;
  var birthDay = 0.obs;
  // Define a variable to check the status of birth date
  var isDateSelected = false.obs;
  // Define variable to handle errors of birth date input
  var birthDateHasError = false.obs;

  // Store the selected birth date
  void storeBirthDate(DateTime selectedBirthDate) {
    birthYear.value = selectedBirthDate.year;
    birthMonth.value = selectedBirthDate.month;
    birthDay.value = selectedBirthDate.day;
    isDateSelected.value = true;
  }

  // Validate birth date input value
  void validateBirthDate() {
    if (isDateSelected.isFalse) {
      birthDateHasError.value = true;
    } else {
      birthDateHasError.value = false;
    }
  }

  // ----------------------

  // GENDER INPUT SECTION
  // Define static list of gender
  List<String> genders = <String>["Female", "Male", "Others"];
  // Define variable to store the ID of selected gender
  var genderID = 1.obs;
  // Define variable to store the name of selected gender
  var genderName = "Male".obs;
  // Define a variable to check the status of gender
  var isGenderSelected = false.obs;
  // Define variable to handle errors of gender input
  var genderHasError = false.obs;

  // Store the selected gender
  void storeSelectedGenderID(int selectedGenderID) {
    genderID.value = selectedGenderID;
    isGenderSelected.value = true;
    convertIdToGenderName();
  }

  // Convert the selected gender ID to gender name
  void convertIdToGenderName() {
    genderName.value = genders[genderID.value];
  }

  // Validate gender input value
  void validateGender() {
    if (isGenderSelected.isFalse) {
      genderHasError.value = true;
    } else {
      genderHasError.value = false;
    }
  }

  // ----------------------

  // ETHNICITY INPUT SECTION
  // Define static list of ethnicity
  List<String> ethnicities = <String>[
    "White",
    "Black",
    "Middle East",
    "Asian",
    "Indians",
    "Latino",
    "Others"
  ];
  // Define variable to store the ID of selected ethnicity
  var ethnicityID = 0.obs;
  // Define variable to store the name of selected ethnicity
  var ethnicityName = "White".obs;
  // Define variable to check the status of ethnicity
  var isEthnicitySelected = false.obs;
  // Define variable to handle errors of ethnicity input
  var ethnicityHasError = false.obs;

  // Store the selected ethnicity
  void storeSelectedEthnicityID(int selectedEthnicityID) {
    ethnicityID.value = selectedEthnicityID;
    isEthnicitySelected.value = true;
    convertIdToEthnicityName();
  }

  // Convert the selected ethnicity ID to ethnicity name
  void convertIdToEthnicityName() {
    ethnicityName.value = ethnicities[ethnicityID.value];
  }

  // Validate ethnicity input value
  void validateEthnicity() {
    if (isEthnicitySelected.isFalse) {
      ethnicityHasError.value = true;
    } else {
      ethnicityHasError.value = false;
    }
  }

  // ----------------------
  // FAVOURITE FASHION STYLE SECTION
  // Define static list of fashion styles
  List<String> fashionStyles = <String>[
    "Casual",
    "Elegant (Formal)",
    "Sport",
    "Wedding",
    "Sexy",
    "Swimwear",
  ];
  // Define variable to store the ID of selected fashion style
  var fashionStyleID = 0.obs;
  // Define variable to store the name of selected fashion style
  var fashionStyleName = "Casual".obs;
  // Define variable to check the status of fashion style
  var isFashionStyleSelected = false.obs;
  // Define variable to handle errors of fashion style input
  var fashionStyleHasErrors = false.obs;

  // Store the selected fashion style
  void storeSelectedFashionStyleID(int selectedFashionStyleID) {
    fashionStyleID.value = selectedFashionStyleID;
    isFashionStyleSelected.value = true;
    convertIdToFashionStyleName();
  }

  // Convert the selected fashion style ID to fashion style name
  void convertIdToFashionStyleName() {
    fashionStyleName.value = fashionStyles[fashionStyleID.value];
  }

  // Validate fashion style input
  void validateFashionStyle() {
    if (isFashionStyleSelected.isFalse) {
      fashionStyleHasErrors.value = true;
    } else {
      fashionStyleHasErrors.value = false;
    }
  }

  // ----------------------
  // WEIGHT AND HEIGHT INPUT SECTION
  // Define variables to store input values
  var weight = "80".obs;
  var height = "180".obs;
  // Define variables to handle errors for each input
  var weightHasError = false.obs;
  var heightHasError = false.obs;

  // Store the entered weight value
  void storeWeight(String enteredWeight) {
    weight.value = enteredWeight;
  }

  // Store the entered height value
  void storeHeight(String enteredHeight) {
    height.value = enteredHeight;
  }

  // Validate weight input
  void validateWeight() {
    if (!GetUtils.isNum(weight.value) ||
        GetUtils.isNullOrBlank(weight.value)!) {
      weightHasError.value = true;
    } else {
      weightHasError.value = false;
    }
  }

  // Validate height input
  void validateHeight() {
    if (!GetUtils.isNum(height.value) ||
        GetUtils.isNullOrBlank(height.value)!) {
      heightHasError.value = true;
    } else {
      heightHasError.value = false;
    }
  }

  // Loading and validation section
  // Define middleware for redirection
  var hasPermission = false.obs;
  // Define variable to handle loading status
  var spinnerStatus = false.obs;

  // Toggle the spinner status
  void toggleLoading() {
    spinnerStatus.value = !spinnerStatus.value;
  }

  // Change the status of redirection middleware
  void setAuthorized() {
    if (weightHasError.isFalse &&
        heightHasError.isFalse &&
        birthDateHasError.isFalse &&
        genderHasError.isFalse &&
        ethnicityHasError.isFalse &&
        fashionStyleHasErrors.isFalse &&
        nameHasError.isFalse &&
        emailHasError.isFalse &&
        phoneNumberHasError.isFalse) {
      hasPermission.value = true;
    }
  }
}
