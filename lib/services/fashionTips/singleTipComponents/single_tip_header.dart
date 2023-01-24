import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX package
import 'package:get/get.dart';
import 'package:sample/controllers/fashionTip/fashion_tip_controller.dart';

// Other package
import 'package:sample/configs/theme.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sample/configs/constants.dart';
import 'package:sample/packages/space_box_container.dart';

class SingleFashionTipHeader extends StatelessWidget {
  const SingleFashionTipHeader({super.key});

  // Define fashion tip controller
  static final fashionTipController = Get.put(FashionTipController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        // Buttons
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Bookmark button
              CupertinoButton(
                padding: EdgeInsets.zero,
                // Toggle between bookmark status
                onPressed: () {
                  fashionTipController.toggleBookmark();
                },
                child: Obx(
                  () => Icon(
                    fashionTipController.isBookmarked.isFalse
                        ? CupertinoIcons.bookmark
                        : CupertinoIcons.bookmark_fill,
                    size: 30.sp,
                    color: fashionTipController.isBookmarked.isFalse
                        ? PRIMARY_COLOR
                        : MAIN_COLOR,
                  ),
                ),
              ),

              HorizontalSpaceBox(8.w),

              // Like button
              CupertinoButton(
                padding: EdgeInsets.zero,
                // Toggle between like status
                onPressed: () {
                  fashionTipController.toggleLikes();
                },
                child: Obx(
                  () => Icon(
                    fashionTipController.isLiked.isFalse
                        ? CupertinoIcons.heart
                        : CupertinoIcons.heart_fill,
                    size: 30.sp,
                    color: fashionTipController.isLiked.isFalse
                        ? PRIMARY_COLOR
                        : MAIN_COLOR,
                  ),
                ),
              ),

              HorizontalSpaceBox(8.w),

              // Share button
              CupertinoButton(
                padding: EdgeInsets.zero,
                // Open share dialog to share the fashion tip
                onPressed: () {
                  Share.share(
                      "${fashionTipController.fashionTipTitle} \n\n Available at Aware Fashion Tips. \n\n$shareButtonUrl");
                },
                child: Icon(
                  CupertinoIcons.share,
                  color: PRIMARY_COLOR,
                  size: 30.sp,
                ),
              ),
            ],
          ),

          VerticalSpaceBox(20.h),

          // Fashion tip title
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              fashionTipController.fashionTipTitle,
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          VerticalSpaceBox(8.h),

          // Publish date and time
          Row(
            children: [
              // Publish date
              Icon(
                CupertinoIcons.calendar,
                size: 18.sp,
                color: INPUT_PLACEHOLDER,
              ),

              HorizontalSpaceBox(2.w),

              Text(
                fashionTipController.fashionTipPublishDate,
                style: TextStyle(fontSize: 14.sp, color: INPUT_PLACEHOLDER),
              ),

              HorizontalSpaceBox(10.w),

              // Publish time
              Icon(
                CupertinoIcons.clock,
                size: 18.sp,
                color: INPUT_PLACEHOLDER,
              ),

              HorizontalSpaceBox(2.w),

              Text(
                fashionTipController.fashionTipPublishTime,
                style: TextStyle(fontSize: 14.sp, color: INPUT_PLACEHOLDER),
              ),

              HorizontalSpaceBox(10.w),

              // Likes
              Icon(
                CupertinoIcons.heart,
                size: 18.sp,
                color: INPUT_PLACEHOLDER,
              ),

              HorizontalSpaceBox(2.w),

              Obx(
                () => Text(
                  "${fashionTipController.fashionTipLikes} likes",
                  style: TextStyle(fontSize: 14.sp, color: INPUT_PLACEHOLDER),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
