import 'package:get/get.dart';

class SelectCountryController extends GetxController {
  var selectCountry = 0.obs;

  // Store the selected country
  setSelectCountry(int regionID) {
    selectCountry.value = regionID;
  }
}
