import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';

// GetX package
import 'package:get/get.dart';
import 'package:sample/controllers/product/product_controller.dart';

// Other packages
import 'package:sample/configs/constants.dart';
import 'package:sample/configs/theme.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/services/singleProduct/bottom_checkout_bar.dart';
import 'package:sample/services/singleProduct/single_product_detail.dart';

class SingleProductContent extends StatelessWidget {
  const SingleProductContent({super.key});

  // Define product controller
  static final productController = Get.put(ProductController());

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
                // Add item to bookmarks
                onPressed: () {
                  productController.toggleBookmark();
                },
                child: Obx(
                  () => Icon(
                    productController.isBookmarked.isTrue
                        ? CupertinoIcons.bookmark_fill
                        : CupertinoIcons.bookmark,
                    color: productController.isBookmarked.isTrue
                        ? MAIN_COLOR
                        : PRIMARY_COLOR,
                    size: 30.sp,
                  ),
                ),
              ),
              HorizontalSpaceBox(8.w),
              CupertinoButton(
                padding: EdgeInsets.zero,
                // Open share dialog to share the product
                onPressed: () {
                  Share.share(
                      "Check ${productController.productTitle} with Aware discount code, it's only \$${productController.productPrice}! \n\n$shareButtonUrl");
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
            tag: productController.selectedProductIndex.value,
            child: Image.network(
              productController.productImage,
              width: 300.w,
              height: 250.h,
            ),
          ),

          // Product title
          Text(
            productController.productTitle,
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
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),

                VerticalSpaceBox(20.h),

                // Product details component
                SingleProductDetail(productController.productBrand, 0),
                SingleProductDetail(productController.productMarketUrl, 1),
                SingleProductDetail(productController.productCategory, 2),
                SingleProductDetail(productController.productDiscountCode, 3),
              ],
            ),
          ),

          VerticalSpaceBox(10.h),

          // Product price and checkout bar
          BottomCheckoutBar(
              productController.productPrice, productController.productUrl),
        ],
      ),
    );
  }
}
