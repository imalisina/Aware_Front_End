import 'package:get/get.dart';

class RelationsController extends GetxController {
  // Define a variable to store the relation details
  var name = "".obs;
  var genderID = 0.obs;
  var age = "".obs;
  var relationID = 0.obs;

  // Define variable to get the name of relation and gender
  var genderName = "".obs;
  var relationName = "".obs;

  // Define list of gender options
  List<String> genderOptions = <String>[
    "Female",
    "Male",
    "Others",
  ];

  // Define list of relation options
  List<String> relationOptions = <String>[
    "Family",
    "Partner",
    "Best friend",
    "Normal friend",
    "Acquaintance",
  ];

  // Define a variable to handle errors of name input
  var nameHasError = false.obs;
  // Define a variable to handle errors of age input
  var ageHasError = false.obs;
  // Define a variable to handle errors of gender input
  var genderHasError = false.obs;
  // Define a variable to check the status of gender
  var isGenderSelected = false.obs;
  // Define a variable to handle errors of relation input
  var relationHasError = false.obs;
  // Define a variable to check the status of relation
  var isRelationSelected = false.obs;

  // Method to store entered name value
  void storeName(String enteredName) {
    name.value = enteredName;
  }

  // Method to store selected gender ID
  void storeGenderId(int selectedGenderId) {
    genderID.value = selectedGenderId;
    isGenderSelected.value = true;
    convertGenderIdToName();
  }

  // Method to store entered age value
  void storeAge(String enteredAge) {
    age.value = enteredAge;
  }

  // Method to store selected relation ID
  void storeRelationId(int selectedRelationId) {
    relationID.value = selectedRelationId;
    isRelationSelected.value = true;
    convertRelationIdToName();
  }

  // Method to convert and store gender ID to gender name
  void convertGenderIdToName() {
    genderName.value = genderOptions[genderID.value];
  }

  // Method to convert and store relation ID to relation name
  void convertRelationIdToName() {
    relationName.value = relationOptions[relationID.value];
  }

  // Define a variable to store the status of confirm delete
  var confirmedToDelete = false.obs;

  // Method to delete relation
  void deleteRelation(int index) {
    confirmedToDelete.value = true;
  }

  // Validate name input value
  void validateName() {
    if (name.isEmpty || !GetUtils.isAlphabetOnly(name.value)) {
      nameHasError.value = true;
    } else {
      nameHasError.value = false;
    }
  }

  // Validate age input value
  void validateAge() {
    if (age.isBlank! ||
        age.isEmpty ||
        !GetUtils.isLengthEqualTo(age.value, 2)) {
      ageHasError.value = true;
    } else {
      ageHasError.value = false;
    }
  }

  // Validate gender input value
  void validateGender() {
    if (isGenderSelected.isFalse) {
      genderHasError.value = true;
    } else {
      genderHasError.value = false;
    }
  }

  // Validate relation input value
  void validateRelation() {
    if (isRelationSelected.isFalse) {
      relationHasError.value = true;
    } else {
      relationHasError.value = false;
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
    if (nameHasError.isFalse &&
        ageHasError.isFalse &&
        genderHasError.isFalse &&
        relationHasError.isFalse) {
      hasPermission.value = true;
    }
  }

  // Define a variable to store update validation status
  var isUpdatable = true.obs;

  // Method to validate the updated location details
  void updateFriendDetails() {
    if (nameHasError.isTrue ||
        ageHasError.isTrue ||
        genderHasError.isTrue ||
        relationHasError.isTrue) {
      isUpdatable.value = false;
    } else {
      isUpdatable.value = true;
    }
  }
}
