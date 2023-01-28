import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:like_button/like_button.dart';
import 'package:sample/packages/flush_bar_method.dart';
import 'package:share_plus/share_plus.dart';

// GetX package
import 'package:get/get.dart';
import 'package:sample/controllers/product/suggested_product_controller.dart';

// Other packages
import 'package:sample/configs/constants.dart';
import 'package:sample/configs/theme.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/components/products/singleProduct/bottom_checkout_bar.dart';
import 'package:sample/components/products/singleProduct/single_product_detail.dart';

class SingleSuggestedProductContent extends StatelessWidget {
  const SingleSuggestedProductContent({super.key});

  // Define suggested product controller
  static final suggestedProductController =
      Get.put(SuggestedProductController());

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
                    suggestedProductController.toggleBookmark(isLiked);
                    if (!isLiked) {
                      showSnackBar(context,
                          "Product has been added to your bookmarks !");
                    } else {
                      showSnackBar(context,
                          "Product has been removed from your bookmarks");
                    }
                    return suggestedProductController.isBookmarked.value;
                  },
                  size: 30.sp,
                  isLiked: suggestedProductController.isBookmarked.value,
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
              // Share button
              CupertinoButton(
                padding: EdgeInsets.zero,
                // Open share dialog to share the product
                onPressed: () {
                  Share.share(
                      "Check ${suggestedProductController.productTitle} with Aware discount code, it's only \$${suggestedProductController.productPrice} ! \n\n$shareButtonUrl");
                },
                child: Icon(
                  CupertinoIcons.share,
                  color: PRIMARY_COLOR,
                  size: 30.sp,
                ),
              ),
            ],
          ),

          // Product image
          Hero(
            tag: suggestedProductController.productId,
            child: Image.network(
              suggestedProductController.productImage,
              width: 300.w,
              height: 250.h,
            ),
          ),

          // Product title
          Text(
            suggestedProductController.productTitle,
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
                    // More details icon
                    Icon(
                      CupertinoIcons.list_bullet,
                      size: 30.sp,
                    ),
                    HorizontalSpaceBox(5.w),
                    // More details text
                    Text(
                      "Details",
                      style: TextStyle(
                        fontSize: 25.sp,
                        color: MAIN_COLOR,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),

                VerticalSpaceBox(20.h),

                // Product details component
                SingleProductDetail(suggestedProductController.productBrand, 0),
                SingleProductDetail(
                    suggestedProductController.productMarketUrl, 1),
                SingleProductDetail(
                    suggestedProductController.productCategory, 2),
                SingleProductDetail(
                    suggestedProductController.productDiscountCode, 3),
              ],
            ),
          ),

          VerticalSpaceBox(10.h),

          // Product price and checkout bar
          BottomCheckoutBar(suggestedProductController.productPrice,
              suggestedProductController.productUrl),
        ],
      ),
    );
  }
}
