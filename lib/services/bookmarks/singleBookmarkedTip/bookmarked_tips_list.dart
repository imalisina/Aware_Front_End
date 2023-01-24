import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sample/configs/route_names.dart';
import 'package:sample/configs/theme.dart';
import 'package:sample/controllers/fashionTip/bookmarked_fashion_tip_controller.dart';
import 'package:sample/models/bookmarked_tips.dart';
import 'package:sample/packages/space_box_container.dart';

class BookmarkedTipsList extends StatelessWidget {
  const BookmarkedTipsList({super.key});

  // Define bookmarked fashion tip controller
  static final bookmarkedTipController =
      Get.put(BookmarkedFashionTipController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15.w, right: 15.w),
      height: 900.h,
      child: ListView.separated(
        itemCount: BookmarkedTips().bookmarkedTips.length,
        separatorBuilder: (context, _) => VerticalSpaceBox(10.h),
        itemBuilder: (context, index) {
          var bookmarkedTip = BookmarkedTips().bookmarkedTips[index];
          return CupertinoButton(
            padding: EdgeInsets.zero,
            // Store Fashion Tip index and handle routing
            onPressed: () {
              bookmarkedTipController.storeSelectedFashionTip(index);
              Get.toNamed(singleBookmarkedTip);
            },
            child: DottedBorder(
              padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
              borderType: BorderType.RRect,
              dashPattern: const [5, 0.1],
              radius: Radius.circular(5.r),
              color: GHOST_COLOR,
              child: SizedBox(
                child: Row(
                  children: [
                    // Fashion Tip image
                    Container(
                      margin: EdgeInsets.only(left: 4.w),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: Hero(
                          tag: bookmarkedTip.likes,
                          child: Image.network(
                            bookmarkedTip.tipImage,
                            width: 110.w,
                            height: 90.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    // Fashion Tip details
                    Container(
                      height: 90.h,
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 5.w),
                      child: Column(
                        children: [
                          // Fashion Tip title
                          SizedBox(
                            width: 255.w,
                            child: Text(
                              bookmarkedTip.title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: const TextStyle(
                                  color: PRIMARY_COLOR,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),

                          VerticalSpaceBox(3.h),

                          // Fashion Tip body - Main content
                          SizedBox(
                            width: 255.w,
                            child: Text(
                              bookmarkedTip.content,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                  color: SECONDARY_COLOR,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.sp),
                            ),
                          ),

                          VerticalSpaceBox(5.h),

                          // Fashion Tip like details section
                          Container(
                            width: 255.w,
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                // Like icon
                                Icon(
                                  CupertinoIcons.heart_fill,
                                  color: GHOST_COLOR,
                                  size: 18.sp,
                                ),

                                HorizontalSpaceBox(2.w),

                                // Fashion Tip like numbers
                                Text(
                                  "${bookmarkedTip.likes} likes",
                                  style: TextStyle(
                                      color: SECONDARY_COLOR, fontSize: 13.sp),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
