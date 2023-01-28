import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sample/configs/theme.dart';
import 'package:sample/controllers/fashionTip/fashion_tip_controller.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SingleFashionTipFooter extends StatelessWidget {
  const SingleFashionTipFooter({super.key});

  // Define fashion tip controller
  static final fashionTipController = Get.put(FashionTipController());

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: CupertinoButton.filled(
        padding:
            EdgeInsets.only(left: 30.w, right: 30.w, top: 5.h, bottom: 5.h),
        borderRadius: BorderRadius.circular(40.r),
        // Redirect user to selected fashion tip's URL
        onPressed: () async {
          await launchUrlString(
            fashionTipController.fashionTipSource,
            mode: LaunchMode.externalApplication,
          );
        },
        child: Icon(
          CupertinoIcons.globe,
          size: 30.sp,
          color: BACKGROUND_COLOR,
        ),
      ),
    );
  }
}
