import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX package
import 'package:get/get.dart';
import 'package:sample/controllers/locationSettings/location_settings_controller.dart';

// Other packages
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/components/settings/accountSettings/locationSettings/edit_location_toggle.dart';
import 'package:sample/components/settings/accountSettings/locationSettings/enabled_location_inputs.dart';
import 'package:sample/components/settings/accountSettings/locationSettings/disabled_location_inputs.dart';

class LocationSettingsContent extends StatelessWidget {
  const LocationSettingsContent({super.key});

  // Define location settings controller
  static final locationSettingsController =
      Get.put(LocationSettingsController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30.w, right: 30.w),
      child: Obx(
        () => Column(
          children: [
            // Edit toggle button section
            locationSettingsController.isReadOnly.isTrue
                ? const EditLocationToggle()
                : const EmptyBox(),

            locationSettingsController.isReadOnly.value
                ? VerticalSpaceBox(20.h)
                : VerticalSpaceBox(10.h),

            // Display enabled/disabled inputs for location details
            locationSettingsController.isReadOnly.value
                ? const DisabledLocationInputs()
                : const EnabledLocationInputs(),
          ],
        ),
      ),
    );
  }
}
