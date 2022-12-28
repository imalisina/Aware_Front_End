import 'package:get/get.dart';

class WelcomePageController extends GetxController {
  var isLastPage = false.obs;

  // To toggle when it is in the last page of slides
  lastPageSetter() {
    isLastPage.value = true;
  }
}
