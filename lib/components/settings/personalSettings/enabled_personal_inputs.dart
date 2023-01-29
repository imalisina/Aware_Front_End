import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sample/controllers/completeProfile/personal_details_controller.dart';

class EnabledPersonalInputs extends StatelessWidget {
  const EnabledPersonalInputs({super.key});

  // Define personal settings controller
  static final personalSettingsController =
      Get.put(PersonalDetailsController());

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
