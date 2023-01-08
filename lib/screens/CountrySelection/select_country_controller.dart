import 'package:get/get.dart';
import 'package:sample/constants/countries.dart';

class SelectCountryController extends GetxController {
  // Store selected country's index
  var selectedCountryIndex = 0.obs;
  // Store attributes of selected country
  var selectedCountryName = "";
  var selectedCountryFlag = "";
  var selectedCountryCode = "";
  var selectedCountryStates = [];

  // Store the selected country
  setSelectCountry(int regionID) {
    selectedCountryIndex.value = regionID;
    storeSelectedCountryDetails();
  }

  // Find selected country details
  void storeSelectedCountryDetails() {
    Country selectedCountry =
        Country.fromJSON(data[selectedCountryIndex.value]);
    selectedCountryName = selectedCountry.name;
    selectedCountryFlag = selectedCountry.flag;
    selectedCountryCode = selectedCountry.code;
    selectedCountryStates = selectedCountry.states;
  }
}
