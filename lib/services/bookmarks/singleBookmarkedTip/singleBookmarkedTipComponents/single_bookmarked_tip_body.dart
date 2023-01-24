import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sample/controllers/fashionTip/bookmarked_fashion_tip_controller.dart';

class SingleBookmarkedTipBody extends StatelessWidget {
  const SingleBookmarkedTipBody({super.key});

  // Define bookmarked fashion tip controller
  static final bookmarkedTipController =
      Get.put(BookmarkedFashionTipController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        bookmarkedTipController.fashionTipContent,
        style: TextStyle(height: 2.h),
      ),
    );
  }
}
