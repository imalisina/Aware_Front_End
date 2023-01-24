import 'package:flutter/cupertino.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX package
import 'package:get/get.dart';
import 'package:sample/controllers/fashionTip/bookmarked_fashion_tip_controller.dart';

// Other packages
import 'package:sample/configs/constants.dart';
import 'package:sample/configs/theme.dart';
import 'package:sample/packages/space_box_container.dart';

class SingleBookmarkedTipHeader extends StatelessWidget {
  const SingleBookmarkedTipHeader({super.key});

  // Define bookmarked fashion tip controller
  static final bookmarkedTipController =
      Get.put(BookmarkedFashionTipController());

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
                  bookmarkedTipController.toggleBookmark();
                },
                child: Obx(
                  () => Icon(
                    bookmarkedTipController.isBookmarked.isFalse
                        ? CupertinoIcons.bookmark
                        : CupertinoIcons.bookmark_fill,
                    size: 30.sp,
                    color: bookmarkedTipController.isBookmarked.isFalse
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
                  bookmarkedTipController.toggleLikes();
                },
                child: Obx(
                  () => Icon(
                    bookmarkedTipController.isLiked.isFalse
                        ? CupertinoIcons.heart
                        : CupertinoIcons.heart_fill,
                    size: 30.sp,
                    color: bookmarkedTipController.isLiked.isFalse
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
                      "${bookmarkedTipController.fashionTipTitle} \n\n Available at Aware Fashion Tips. \n\n$shareButtonUrl");
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
              bookmarkedTipController.fashionTipTitle,
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
                bookmarkedTipController.fashionTipPublishDate,
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
                bookmarkedTipController.fashionTipPublishTime,
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
                  "${bookmarkedTipController.fashionTipLikes} likes",
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
