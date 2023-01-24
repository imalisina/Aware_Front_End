import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX package
import 'package:get/get.dart';
import 'package:sample/controllers/fashionTip/bookmarked_fashion_tip_controller.dart';

// Other packages
import 'package:sample/configs/theme.dart';

class SingleBookmarkedTipFooter extends StatelessWidget {
  const SingleBookmarkedTipFooter({super.key});

  // Define bookmarked fashion tip controller
  static final bookmarkedTipController =
      Get.put(BookmarkedFashionTipController());

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
            bookmarkedTipController.fashionTipSource,
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
