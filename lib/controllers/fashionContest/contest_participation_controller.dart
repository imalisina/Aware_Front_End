import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ContestParticipationController extends GetxController {
  // Define a variable to store participant's uploaded images
  var facePicturePath = "".obs;
  var fashionPosePicturePath = "".obs;

  // Define a variable to handle errors of picture paths
  var facePicturePathHasError = false.obs;
  var fashionPosePicturePathHasError = false.obs;

  // Method to get the uploaded face picture and perform some operation
  void getUploadedFaceImage(ImageSource imageSource) async {
    final selectedFile = await ImagePicker().pickImage(source: imageSource);
    if (selectedFile != null) {
      facePicturePath.value = selectedFile.path;
      facePicturePathHasError.value = false;
    } else {
      facePicturePathHasError.value = true;
    }
  }

  // Method to get the uploaded fashion pose picture and perform some operation
  void getUploadedFashionPoseImage(ImageSource imageSource) async {
    final selectedFile = await ImagePicker().pickImage(source: imageSource);
    if (selectedFile != null) {
      fashionPosePicturePath.value = selectedFile.path;
      fashionPosePicturePathHasError.value = false;
    } else {
      fashionPosePicturePathHasError.value = false;
    }
  }

  // Method to remove the uploaded face picture
  void removeUploadFacePicture() {
    facePicturePath.value = "";
  }

  // Method to remove the uploaded fashion pose picture
  void removeUploadFashionPosePicture() {
    fashionPosePicturePath.value = "";
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
    if (facePicturePathHasError.isFalse &&
        fashionPosePicturePathHasError.isFalse) {
      hasPermission.value = true;
    }
  }
}
