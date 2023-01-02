import 'package:get/get.dart';

class ContactUsController extends GetxController {
  // Define static list of subjects
  List<String> subjects = <String>[
    "General",
    "Question",
    "Account & passwords",
    "Issue",
    "Suggestion",
    "Others"
  ];
  // Define variable to store the ID of select subject
  var subjectID = 0.obs;
  // Define variable to store the name of selected subject
  var subjectName = "General".obs;
  // Define variable to store the description
  var description = "".obs;
  // Define variable to store the status of description validation
  var descriptionHasError = false.obs;
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
    if (descriptionHasError.isFalse) {
      hasPermission.value = true;
    }
  }

  // Store the written description
  void storeDescription(String writtenDescription) {
    description.value = writtenDescription;
  }

  // Validating written description
  void descriptionValidation() {
    if (description.isEmpty || description.isBlank!) {
      descriptionHasError.value = true;
    } else {
      descriptionHasError.value = false;
    }
  }

  // Store the selected subject
  void storeSelectedSubjectID(int subjectId) {
    subjectID.value = subjectId;
    convertIdToName();
  }

  // Convert the selected subject ID to subject name
  void convertIdToName() {
    subjectName.value = subjects[subjectID.value];
  }
}
