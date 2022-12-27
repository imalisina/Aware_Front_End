import 'package:get/get.dart';

class WelcomePageController extends GetxController {
  var isLastPage = false.obs;

  lastPageSetter() {
    isLastPage.value = true;
  }
}
