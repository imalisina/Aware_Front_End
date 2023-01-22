import 'package:get/get.dart';

class ProfileConfirmationController extends GetxController {
  // Define variable to store the loading status
  var loadingStatus = false.obs;

  // Method to toggle between loading status
  void toggleLoading() {
    loadingStatus.value = !loadingStatus.value;
  }
}
