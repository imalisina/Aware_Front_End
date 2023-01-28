import 'package:flutter/cupertino.dart';
import 'package:like_button/like_button.dart';
import 'package:sample/packages/flush_bar_method.dart';
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
              Obx(
                () => LikeButton(
                  padding: EdgeInsets.only(left: 6.w, right: 6.w),
                  circleColor: const CircleColor(
                      start: SECONDARY_COLOR, end: PRIMARY_COLOR),
                  bubblesColor: const BubblesColor(
                      dotPrimaryColor: MAIN_COLOR,
                      dotSecondaryColor: PRIMARY_COLOR,
                      dotThirdColor: GHOST_COLOR,
                      dotLastColor: SECONDARY_COLOR),
                  // Toggle bookmark status and handle operation in controller
                  onTap: (isLiked) async {
                    bookmarkedTipController.toggleBookmark(isLiked);
                    if (!isLiked) {
                      showSnackBar(context,
                          "Fashion tip has been added to your bookmarks !");
                    } else {
                      showSnackBar(context,
                          "Fashion tip has been removed from your bookmarks");
                    }
                    return bookmarkedTipController.isBookmarked.value;
                  },
                  size: 30.sp,
                  isLiked: bookmarkedTipController.isBookmarked.value,
                  likeBuilder: (isLiked) {
                    return Icon(
                      isLiked
                          ? CupertinoIcons.bookmark_fill
                          : CupertinoIcons.bookmark,
                      color: isLiked ? MAIN_COLOR : PRIMARY_COLOR,
                      size: 30.sp,
                    );
                  },
                ),
              ),

              HorizontalSpaceBox(8.w),

              // Like button
              Obx(
                () => LikeButton(
                  padding: EdgeInsets.only(left: 6.w, right: 6.w),
                  circleColor: const CircleColor(
                      start: SECONDARY_COLOR, end: PRIMARY_COLOR),
                  bubblesColor: const BubblesColor(
                    dotPrimaryColor: MAIN_COLOR,
                    dotSecondaryColor: PRIMARY_COLOR,
                    dotThirdColor: MAIN_COLOR,
                    dotLastColor: SECONDARY_COLOR,
                  ),
                  // Toggle like status and handle operation in controller
                  onTap: (isLiked) async {
                    bookmarkedTipController.toggleLikes(isLiked);
                    return bookmarkedTipController.isLiked.value;
                  },
                  size: 30.sp,
                  isLiked: bookmarkedTipController.isLiked.value,
                  likeBuilder: (isLiked) {
                    return Icon(
                      isLiked
                          ? CupertinoIcons.heart_fill
                          : CupertinoIcons.heart,
                      color: isLiked ? MAIN_COLOR : PRIMARY_COLOR,
                      size: 30.sp,
                    );
                  },
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
