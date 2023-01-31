import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX package
import 'package:get/get.dart';

// Other packages
import 'package:sample/configs/theme.dart';

class AddNewCollectionButton extends StatelessWidget {
  // Define variables to store state values
  final String buttonRoute;
  final IconData buttonIcon;
  // ignore: use_key_in_widget_constructors
  const AddNewCollectionButton(
      {required this.buttonIcon, required this.buttonRoute});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      alignment: Alignment.centerRight,
      margin: EdgeInsets.only(right: 20.w),
      child: SizedBox(
        width: 100.w,
        child: CupertinoButton.filled(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
          borderRadius: BorderRadius.circular(40.r),
          // Handle routing process
          onPressed: () {
            Get.toNamed(buttonRoute);
          },
          // Button icon
          child: Icon(
            buttonIcon,
            color: BACKGROUND_COLOR,
            size: 30.sp,
          ),
        ),
      ),
    );
  }
}
