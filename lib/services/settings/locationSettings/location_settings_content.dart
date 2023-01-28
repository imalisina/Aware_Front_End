import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX package
import 'package:get/get.dart';
import 'package:sample/controllers/location/location_controller.dart';

// Other packages
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/services/settings/locationSettings/edit_location_toggle.dart';
import 'package:sample/services/settings/locationSettings/enabled_location_inputs.dart';
import 'package:sample/services/settings/locationSettings/disabled_location_inputs.dart';

class LocationSettingsContent extends StatelessWidget {
  const LocationSettingsContent({super.key});

  // Define location details controller
  static final locationController = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30.w, right: 30.w),
      child: Obx(
        () => Column(
          children: [
            // Edit toggle button section main container
            locationController.isReadOnly.isTrue
                ? const EditLocationToggle()
                : const EmptyBox(),

            locationController.isReadOnly.value
                ? VerticalSpaceBox(20.h)
                : VerticalSpaceBox(10.h),

            // Display enabled/disabled inputs for location details
            locationController.isReadOnly.value
                ? const DisabledLocationInputs()
                : const EnabledLocationInputs(),
          ],
        ),
      ),
    );
  }
}
