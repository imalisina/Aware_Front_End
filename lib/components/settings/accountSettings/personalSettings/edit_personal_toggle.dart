import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX package
import 'package:get/get.dart';

// Other packages
import 'package:sample/configs/theme.dart';
import 'package:sample/controllers/settings/personalSettings/personal_settings_controller.dart';

class EditPersonalToggle extends StatelessWidget {
  const EditPersonalToggle({super.key});

  // Define location settings controller
  static final personalSettingsController =
      Get.put(PersonalSettingsController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      alignment: Alignment.centerRight,
      child: SizedBox(
        width: 100.w,
        child: CupertinoButton.filled(
          padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
          borderRadius: BorderRadius.circular(40.r),
          child: Icon(
            Icons.drive_file_rename_outline_rounded,
            color: BACKGROUND_COLOR,
            size: 30.sp,
          ),
          onPressed: () {
            personalSettingsController.toggleReadOnly();
          },
        ),
      ),
    );
  }
}
