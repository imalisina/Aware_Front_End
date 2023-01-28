import 'package:get/get.dart';
import 'package:sample/models/countries.dart';

class CountrySelectionController extends GetxController {
  // COUNTRY SELECTION SECTION
  // Store selected country's index
  var selectedCountryIndex = 0.obs;
  // Store attributes of selected country
  var selectedCountryName = "";
  var selectedCountryFlag = "";
  var selectedCountryCode = "";
  var selectedCountryStates = [];

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
}