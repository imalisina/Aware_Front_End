import 'package:get/get.dart';
import 'package:sample/controllers/countrySelection/select_country_controller.dart';
import 'package:sample/models/countries.dart';

class LocationSettingsController extends GetxController {
  // Define a variable to store the status of inputs
  var isReadOnly = true.obs;

  // Method to toggle input status
  void toggleReadOnly() {
    isReadOnly.value = !isReadOnly.value;
  }

  // COUNTRY & STATE INPUT SECTION
  // Define variable to store the state
  var stateID = 0.obs;
  // Define a variable to store the state name
  var stateName = "".obs;
  // Define a variable to check the status of state
  var isStateSelected = false.obs;
  // Define variable to handle errors of state input
  var stateHasError = false.obs;

  // Convert state id to state name
  void idToNameConverter() {
    stateName.value = Countries()
        .countries[SelectCountryController().selectedCountryIndex.value]
        .states[stateID.value];
  }

  // Store selected state
  void storeSelectedStateID(int selectedStateID) {
    stateID.value = selectedStateID;
    isStateSelected.value = true;
    idToNameConverter();
  }

  // Validate state input valie
  void validateState() {
    if (isStateSelected.isFalse) {
      stateHasError.value = true;
    } else {
      stateHasError.value = false;
    }
  }

  // ZIP CODE INPUT SECTION
  // Define a variable to store ZIP code value
  var zip = "".obs;
  // Define a variable to handle errors for ZIP code
  var zipHasError = false.obs;

  // Store the entered ZIP code value
  void storeZipCode(String enteredZipCode) {
    zip.value = enteredZipCode;
  }

  // Validate ZIP code input
  void validateZipCode() {
    if (!GetUtils.isNum(zip.value) || GetUtils.isNullOrBlank(zip.value)!) {
      zipHasError.value = true;
    } else {
      zipHasError.value = false;
    }
  }

  // ADDRESS INPUT SECTION
  // Define a variable to store address value
  var address = "".obs;
  // Define a variable to handle errors for address
  var addressHasError = false.obs;

  // Store the entered address value
  void storeAddress(String enteredAddress) {
    address.value = enteredAddress;
  }

  // Validate address input
  void validateAddress() {
    if (GetUtils.isNullOrBlank(address.value)!) {
      addressHasError.value = true;
    } else {
      addressHasError.value = false;
    }
  }

  // Define middleware for redirection
  var hasPermission = false.obs;

  // Change the status of redirection middleware
  void setAuthorized() {
    if (stateHasError.isFalse &&
        zipHasError.isFalse &&
        addressHasError.isFalse) {
      hasPermission.value = true;
    }
  }

  // Define variable to handle loading status
  var spinnerStatus = false.obs;

  // Toggle the spinner status
  void toggleLoading() {
    spinnerStatus.value = !spinnerStatus.value;
  }
}
