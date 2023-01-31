import 'package:get/get.dart';

class PlacesController extends GetxController {
  // Define a variable to store the place derails
  var placeName = "".obs;

  // Define a variable to handler errors of place name input
  var placeNameHasError = false.obs;

  // Method to store entered place name value
  void storePlaceName(String enteredPlaceName) {
    placeName.value = enteredPlaceName;
  }

  // Define a variable to store the status of confirm delete
  var confirmedToDelete = false.obs;

  // Method to delete place
  void deletePlace(int index) {
    confirmedToDelete.value = true;
  }

  // Validate place name input value
  void validateName() {
    if (placeName.isEmpty || !GetUtils.isAlphabetOnly(placeName.value)) {
      placeNameHasError.value = true;
    } else {
      placeNameHasError.value = false;
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
    if (placeNameHasError.isFalse) {
      hasPermission.value = true;
    }
  }

  // Define a variable to store update validation status
  var isUpdatable = true.obs;

  // Method to validate the updated place details
  void updatePlaceDetails() {
    if (placeNameHasError.isTrue) {
      isUpdatable.value = false;
    } else {
      isUpdatable.value = true;
    }
  }
}
