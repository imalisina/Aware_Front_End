import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class OutfitsController extends GetxController {
  // Define a variabel to store the outfit details
  var name = "".obs;
  var uploadedImagePath = "".obs;

  // Define a variable to handle errors of name input
  var nameHasError = false.obs;
  // Define a variable to handle errors of image input
  var imageHasError = false.obs;

  // Method to get the uploaded image and perform some operation
  void getUploadedImage(ImageSource imageSource) async {
    final selectedFile = await ImagePicker().pickImage(source: imageSource);
    if (selectedFile != null) {
      uploadedImagePath.value = selectedFile.path;
      imageHasError.value = false;
    } else {
      imageHasError.value = true;
    }
  }

  // Method to remove the uploaded image
  void removeUploadedImage() {
    uploadedImagePath.value = "";
  }

  // Method to store entered name value
  void storeName(String enteredName) {
    name.value = enteredName;
  }

  // Validate name input value
  void validateName() {
    if (name.isEmpty || !GetUtils.isAlphabetOnly(name.value)) {
      nameHasError.value = true;
    } else {
      nameHasError.value = false;
    }
  }

  // Validate uploaded image field
  void validateImage() {
    if (!GetUtils.isImage(uploadedImagePath.value)) {
      imageHasError.value = true;
    } else {
      imageHasError.value = false;
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
    if (nameHasError.isFalse && imageHasError.isFalse) {
      hasPermission.value = true;
    }
  }

  // Define a variable to store update validation status
  var isUpdatable = true.obs;

  // Method to validate the updated outfit details
  void updateOutfitDetails() {
    if (nameHasError.isTrue || imageHasError.isTrue) {
      isUpdatable.value = false;
    } else {
      isUpdatable.value = true;
    }
  }
}
