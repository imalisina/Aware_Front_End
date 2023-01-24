import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sample/controllers/fashionTip/bookmarked_fashion_tip_controller.dart';

class SingleBookmarkedTipBanner extends StatelessWidget {
  const SingleBookmarkedTipBanner({super.key});

  // Define bookmarked fashion tip controller
  static final bookmarkedTipController =
      Get.put(BookmarkedFashionTipController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // Fashion tip image
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: Hero(
          tag: bookmarkedTipController.fashionTipLikes,
          child: Image.network(
            bookmarkedTipController.fashionTipImageUrl,
            width: 400.w,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
