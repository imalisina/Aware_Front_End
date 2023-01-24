import 'package:flutter/cupertino.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX package
import 'package:get/get.dart';
import 'package:sample/controllers/product/bookmarked_product_controller.dart';

// Other packages
import 'package:sample/configs/theme.dart';
import 'package:sample/configs/constants.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/services/singleProduct/bottom_checkout_bar.dart';
import 'package:sample/services/singleProduct/single_product_detail.dart';

class SingleBookmarkedProductContent extends StatelessWidget {
  const SingleBookmarkedProductContent({super.key});

  // Define bookmarked product controller
  static final bookmarkedProductController =
      Get.put(BookmarkedProductController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Bookmark button
              CupertinoButton(
                padding: EdgeInsets.zero,
                // Toggle between bookmark status
                onPressed: () {
                  bookmarkedProductController.toggleBookmark();
                },
                child: Obx(
                  () => Icon(
                    bookmarkedProductController.isBookmarked.isTrue
                        ? CupertinoIcons.bookmark_fill
                        : CupertinoIcons.bookmark,
                    color: bookmarkedProductController.isBookmarked.isTrue
                        ? MAIN_COLOR
                        : PRIMARY_COLOR,
                    size: 30.sp,
                  ),
                ),
              ),
              HorizontalSpaceBox(8.w),
              // Share button
              CupertinoButton(
                padding: EdgeInsets.zero,
                // Open share dialog to share the product
                onPressed: () {
                  Share.share(
                      "Check ${bookmarkedProductController.productTitle} with Aware discount code, it's only \$${bookmarkedProductController.productPrice} ! \n\n$shareButtonUrl");
                },
                child: Icon(
                  CupertinoIcons.share,
                  color: PRIMARY_COLOR,
                  size: 30.sp,
                ),
              )
            ],
          ),

          // Product image
          Hero(
            tag: bookmarkedProductController.productId,
            child: Image.network(
              bookmarkedProductController.productImage,
              width: 300.w,
              height: 250.h,
            ),
          ),

          // Product title
          Text(
            bookmarkedProductController.productTitle,
            style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w600),
          ),

          VerticalSpaceBox(50.h),

          // More details about the product
          Container(
            width: double.maxFinite,
            margin: EdgeInsets.only(left: 15.w, right: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      CupertinoIcons.list_bullet,
                      size: 30.sp,
                    ),
                    HorizontalSpaceBox(5.w),
                    Text(
                      "Details",
                      style: TextStyle(
                          fontSize: 25.sp,
                          color: MAIN_COLOR,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),

                VerticalSpaceBox(20.h),

                // Product details component
                SingleProductDetail(
                    bookmarkedProductController.productBrand, 0),
                SingleProductDetail(
                    bookmarkedProductController.productMarketUrl, 1),
                SingleProductDetail(
                    bookmarkedProductController.productCategory, 2),
                SingleProductDetail(
                    bookmarkedProductController.productDiscountCode, 3),
              ],
            ),
          ),

          VerticalSpaceBox(10.h),

          // Product price and checkout bar
          BottomCheckoutBar(bookmarkedProductController.productPrice,
              bookmarkedProductController.productUrl),
        ],
      ),
    );
  }
}
