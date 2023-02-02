import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sample/controllers/fashionContest/contest_participation_controller.dart';
import 'package:sample/packages/space_box_container.dart';

class UploadedFacePicturePreview extends StatelessWidget {
  const UploadedFacePicturePreview({super.key});

  // Define contest participation controller
  static final contestParticipationController =
      Get.put(ContestParticipationController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => contestParticipationController.facePicturePath.value == ''
          ? const EmptyBox()
          : const Text("error"),
    );
  }
}
