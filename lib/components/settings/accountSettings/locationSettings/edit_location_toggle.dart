import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX package
import 'package:get/get.dart';

// Other packages
import 'package:sample/configs/theme.dart';
import 'package:sample/controllers/settings/locationSettings/location_settings_controller.dart';

class EditLocationToggle extends StatelessWidget {
  const EditLocationToggle({super.key});

  // Define location settings controller
  static final locationSettingsController = Get.put(LocationSettingsController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      alignment: Alignment.centerRight,
      child: Container(
        alignment: Alignment.centerRight,
        width: 100.w,
        child: CupertinoButton.filled(
          padding:
              EdgeInsets.only(left: 40.w, right: 40.w, top: 10.h, bottom: 10.h),
          borderRadius: BorderRadius.circular(40.r),
          child: Icon(
            CupertinoIcons.pen,
            color: BACKGROUND_COLOR,
            size: 30.sp,
          ),
          onPressed: () {
            locationSettingsController.toggleReadOnly();
          },
        ),
      ),
    );
  }
}
