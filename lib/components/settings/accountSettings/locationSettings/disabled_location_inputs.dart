import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX packages
import 'package:get/get.dart';

// Other packages
import 'package:sample/configs/theme.dart';
import 'package:sample/controllers/settings/locationSettings/location_settings_controller.dart';
import 'package:sample/packages/space_box_container.dart';

class DisabledLocationInputs extends StatelessWidget {
  const DisabledLocationInputs({super.key});

  // Define location controller
  static final locationSettingsController = Get.put(LocationSettingsController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          // Country disabled input
          SizedBox(
            height: 55.h,
            child: CupertinoTextField(
              placeholder: "Country : ${locationSettingsController.countryName}",
              placeholderStyle: inputActiveDataPlaceholderStyle,
              readOnly: true,
            ),
          ),

          VerticalSpaceBox(20.h),

          // State disabled input
          SizedBox(
            height: 55.h,
            child: CupertinoTextField(
              placeholder: "State : ${locationSettingsController.stateName.value}",
              placeholderStyle: inputActiveDataPlaceholderStyle,
              readOnly: true,
            ),
          ),

          VerticalSpaceBox(20.h),

          // ZIP Code disabled input
          SizedBox(
            height: 55.h,
            child: CupertinoTextField(
              placeholder: "ZIP code : ${locationSettingsController.zip.value}",
              placeholderStyle: inputActiveDataPlaceholderStyle,
              readOnly: true,
            ),
          ),

          VerticalSpaceBox(20.h),

          // Address disabled input
          SizedBox(
            height: 80.h,
            child: CupertinoTextField(
              placeholder: "Address : ${locationSettingsController.address.value}",
              placeholderStyle: inputActiveDataPlaceholderStyle,
              readOnly: true,
              maxLines: 5,
            ),
          ),
        ],
      ),
    );
  }
}
