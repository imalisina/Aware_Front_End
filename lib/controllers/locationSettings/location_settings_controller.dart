// GetX package
import 'package:get/get.dart';
import 'package:sample/models/countries.dart';

class LocationSettingsController extends GetxController {
  // Define a variable to store the status of inputs
  var isReadOnly = true.obs;

  // Method to toggle input status
  void toggleReadOnly() {
    isReadOnly.value = !isReadOnly.value;
  }

  // COUNTRY SELECTION SECTION
  // Store selected country's index
  var selectedCountryIndex = 5.obs;
  // Store attributes of selected country
  var selectedCountryName = "Iran";
  var selectedCountryFlag = "";
  var selectedCountryCode = "";
  var selectedCountryStates = <dynamic>[
    "Tehran",
    "Isfahan",
    "Mazandaran",
    "Shiraz"
  ];

  // Store selected country
  setSelectCountry(int regionID) {
    selectedCountryIndex.value = regionID;
    storeSelectedCountryDetails();
  }

  // Extract selected country details
  void storeSelectedCountryDetails() {
    Country selectedCountry =
        Country.fromJSON(data[selectedCountryIndex.value]);
    selectedCountryName = selectedCountry.name;
    selectedCountryFlag = selectedCountry.flag;
    selectedCountryCode = selectedCountry.code;
    selectedCountryStates = selectedCountry.states;
  }

  // COUNTRY & STATE INPUT SECTION
  // Define a variable to store selected country name
  late String countryName =
      Countries().countries[selectedCountryIndex.value].name;
  // Define variable to store the state
  var stateID = 0.obs;
  // Define a variable to store the state name
  var stateName = "".obs;
  // Define a variable to check the status of state
  var isStateSelected = false.obs;
  // Define variable to handle errors of state input
  var stateHasError = false.obs;

  // Convert the state id to state name
  void idToNameConverter() {
    stateName.value =
        Countries().countries[selectedCountryIndex.value].states[stateID.value];
  }

  // Store the selected state
  void storeSelectedStateID(int selectedStateID) {
    stateID.value = selectedStateID;
    isStateSelected.value = true;
    idToNameConverter();
  }

  // Validate state input value
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
    if (stateHasError.isTrue || zipHasError.isTrue || addressHasError.isTrue) {
      isUpdatable.value = false;
      isReadOnly.value = false;
    } else {
      isUpdatable.value = true;
      isReadOnly.value = true;
    }
  }
}
