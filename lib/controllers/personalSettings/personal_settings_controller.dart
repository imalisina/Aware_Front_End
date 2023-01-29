import 'package:get/get.dart';

class PersonalSettingsController extends GetxController {
  // Define a variable to store the status of inputs
  var isReadOnly = true.obs;

  // Method to toggle input status
  void toggleReadOnly() {
    isReadOnly.value = !isReadOnly.value;
  }

  // GETTING BASIC INPUTS --> FULLNAME | EMAIL | PHONE NUMBER
  // Define variables to store input values
  var name = "Tracy Caller".obs;

  // Define variables to handle errors for each input
  var nameHasError = false.obs;

  // Store the entered name value
  void storeName(String enteredName) {
    name.value = enteredName;
  }

  // Validate name input
  void validateName() {
    if (name.value.length < 5 && !GetUtils.isAlphabetOnly(name.value)) {
      nameHasError.value = true;
    } else {
      nameHasError.value = false;
    }
  }

  // BIRTH DATE INPUT SECTION
  // Define initial value for Date Time in Modal
  var defaultDate = DateTime.now();
  // Define variable to store the birthdate
  var birthYear = 1998.obs;
  var birthMonth = 03.obs;
  var birthDay = 17.obs;
  // Define a variable to check the status of birth date
  var isDateSelected = true.obs;
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

  // GENDER INPUT SECTION
  // Define static list of gender
  List<String> genders = <String>["Male", "Female", "Others"];
  // Define variable to store the ID of selected gender
  var genderID = 1.obs;
  // Define variable to store the name of selected gender
  var genderName = "Female".obs;
  // Define a variable to check the status of gender
  var isGenderSelected = true.obs;
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
  var ethnicityID = 1.obs;
  // Define variable to store the name of selected ethnicity
  var ethnicityName = "White".obs;
  // Define variable to check the status of ethnicity
  var isEthnicitySelected = true.obs;
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
  var fashionStyleID = 1.obs;
  // Define variable to store the name of selected fashion style
  var fashionStyleName = "Casual".obs;
  // Define variable to check the status of fashion style
  var isFashionStyleSelected = true.obs;
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
  var weight = "".obs;
  var height = "".obs;
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

  // Define a variable to store update validation status
  var isUpdatable = true.obs;

  // Method to validate the upadted location details
  void updateLocationDetails() {
    if (weightHasError.isTrue ||
        heightHasError.isTrue ||
        birthDateHasError.isTrue ||
        genderHasError.isTrue ||
        ethnicityHasError.isTrue ||
        fashionStyleHasErrors.isTrue ||
        nameHasError.isTrue) {
      isUpdatable.value = false;
      isReadOnly.value = false;
    } else {
      isUpdatable.value = true;
      isReadOnly.value = true;
    }
  }
}
