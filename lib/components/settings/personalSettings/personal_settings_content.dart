import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sample/controllers/personalSettings/personal_settings_controller.dart';

class PersonalSettingsContent extends StatelessWidget {
  const PersonalSettingsContent({super.key});

  // Define personal settings controller
  static final personalSettingsController =
      Get.put(PersonalSettingsController());

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
