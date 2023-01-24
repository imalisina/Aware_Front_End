import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sample/configs/route_names.dart';
import 'package:sample/configs/theme.dart';
import 'package:sample/controllers/product/bookmarked_product_controller.dart';
import 'package:sample/models/bookmarked_products.dart';
import 'package:sample/packages/space_box_container.dart';

class BookmarkedProductsList extends StatelessWidget {
  const BookmarkedProductsList({super.key});

  // Define bookmarked product controller
  static final bookmarkedProductController =
      Get.put(BookmarkedProductController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15.w, right: 15.w),
      height: 900.h,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.9.h,
          crossAxisCount: 2,
          mainAxisSpacing: 15.h,
          crossAxisSpacing: 15.w,
        ),
        itemCount: BookmarkedProducts().bookmarkedProducts.length,
        itemBuilder: (context, index) {
          var bookmarkedProduct =
              BookmarkedProducts().bookmarkedProducts[index];
          return CupertinoButton(
            padding: EdgeInsets.zero,
            // Store bookmarked product index and handle routing
            onPressed: () {
              bookmarkedProductController.storeSelectedProduct(index);
              Get.toNamed(singleBookmarkedProduct);
            },
            // Product main card
            child: DottedBorder(
              borderType: BorderType.RRect,
              dashPattern: const [5, 0.1],
              radius: Radius.circular(10.r),
              color: GHOST_COLOR,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.r),
                    child: Hero(
                      tag: bookmarkedProduct.productId,
                      child: Image.network(
                        bookmarkedProduct.productImage,
                        width: 150.w,
                        height: 150.h,
                      ),
                    ),
                  ),
                  VerticalSpaceBox(4.h),
                  // Product title
                  Container(
                    alignment: Alignment.center,
                    width: 150.w,
                    child: Text(
                      bookmarkedProduct.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(color: PRIMARY_COLOR),
                    ),
                  ),
                  VerticalSpaceBox(2.h),
                  // Product details section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Product brand logo icon
                      Icon(
                        CupertinoIcons.bag_fill,
                        size: 15.sp,
                        color: GHOST_COLOR,
                      ),

                      HorizontalSpaceBox(3.w),

                      // Product brand logo image
                      Image.network(
                        bookmarkedProduct.brandLogo,
                        width: 30,
                        height: 30,
                      ),

                      HorizontalSpaceBox(20.w),

                      // Product price icon
                      Icon(
                        CupertinoIcons.tag_fill,
                        size: 15.sp,
                        color: GHOST_COLOR,
                      ),

                      HorizontalSpaceBox(3.w),

                      // Product price
                      Text(
                        "\$${bookmarkedProduct.price}",
                        style: TextStyle(color: PRIMARY_COLOR, fontSize: 15.sp),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}