import 'package:flutter/cupertino.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX packages
import 'package:get/get.dart';

// Other packages
import 'package:sample/configs/theme.dart';
import 'package:sample/configs/route_names.dart';
import 'package:sample/controllers/product/suggested_product_controller.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/models/suggested_products.dart';

class SuggestedProductsList extends StatelessWidget {
  const SuggestedProductsList({super.key});

  // Define suggested product controller
  static final suggestedProductController =
      Get.put(SuggestedProductController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: SuggestedProducts().suggestedProducts.length,
        separatorBuilder: (context, _) => HorizontalSpaceBox(10.w),
        itemBuilder: (context, index) {
          var product = SuggestedProducts().suggestedProducts[index];
          return CupertinoButton(
            padding: EdgeInsets.zero,
            // Store product index and handle routing
            onPressed: () {
              suggestedProductController.storeSelectedProduct(index);
              Get.toNamed(singleSuggestedProduct);
            },
            // Product main card
            child: DottedBorder(
              borderType: BorderType.RRect,
              dashPattern: const [5, 0.1],
              radius: Radius.circular(10.r),
              color: GHOST_COLOR,
              child: Column(
                children: [
                  // Product image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.r),
                    child: Hero(
                      tag: product.productId,
                      child: Image.network(
                        product.productImage,
                        fit: BoxFit.cover,
                        width: 150.w,
                        height: 150.h,
                      ),
                    ),
                  ),

                  VerticalSpaceBox(4.h),

                  // Product title
                  Container(
                    alignment: Alignment.center,
                    width: 109.w,
                    child: Text(
                      product.title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(color: PRIMARY_COLOR),
                    ),
                  ),

                  VerticalSpaceBox(2.h),

                  // Product details
                  Row(
                    children: [
                      // Product brand logo icon
                      Icon(
                        Icons.local_mall_rounded,
                        size: 15.sp,
                        color: GHOST_COLOR,
                      ),

                      HorizontalSpaceBox(3.w),

                      // Product brand logo image
                      Image.network(
                        product.brandLogo,
                        width: 30,
                        height: 30,
                      ),

                      HorizontalSpaceBox(20.w),

                      // Product price icon
                      Icon(
                        Icons.local_offer_rounded,
                        size: 15.sp,
                        color: GHOST_COLOR,
                      ),

                      HorizontalSpaceBox(3.w),

                      // Product price
                      Text(
                        "\$${product.price}",
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
