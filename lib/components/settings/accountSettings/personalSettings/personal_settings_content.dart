import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX packages
import 'package:get/get.dart';
import 'package:sample/components/settings/accountSettings/personalSettings/disabled_personal_inputs.dart';
import 'package:sample/components/settings/accountSettings/personalSettings/edit_personal_toggle.dart';
import 'package:sample/components/settings/accountSettings/personalSettings/enabled_personal_inputs.dart';
import 'package:sample/controllers/personalSettings/personal_settings_controller.dart';

// Other packages
import 'package:sample/packages/space_box_container.dart';


class PersonalSettingsContent extends StatelessWidget {
  const PersonalSettingsContent({super.key});

  // Define personal settings controller
  static final personalSettingsController =
      Get.put(PersonalSettingsController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30.w, right: 30.w),
      child: Obx(
        () => Column(
          children: [
            // Edit toggle button section
            personalSettingsController.isReadOnly.isTrue
                ? const EditPersonalToggle()
                : const EmptyBox(),

            personalSettingsController.isReadOnly.value
                ? VerticalSpaceBox(20.h)
                : VerticalSpaceBox(10.h),

            // Display enabled/disable inputs for location details
            personalSettingsController.isReadOnly.value
                ? const DisabledPersonalInputs()
                : const EnabledPersonalInputs(),
          ],
        ),
      ),
    );
  }
}
