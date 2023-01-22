import 'package:flutter/cupertino.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// Other packages
import 'package:sample/configs/theme.dart';
import 'package:sample/controllers/product/product_controller.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/models/products.dart';

class SuggestedProductsList extends StatelessWidget {
  const SuggestedProductsList({super.key});

  // Define product controller
  static final productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: Products().products.length,
        separatorBuilder: (context, _) => HorizontalSpaceBox(10.w),
        itemBuilder: (context, index) {
          var product = Products().products[index];
          return CupertinoButton(
            padding: EdgeInsets.zero,
            // Store product index and handle routing
            onPressed: () {
              productController.storeSelectedProduct(index);
              Get.toNamed("/shop/products/single");
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Product main card
                DottedBorder(
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
                          tag: index,
                          child: Image.network(
                            product.productImage,
                            width: 150.w,
                            height: 150.h,
                          ),
                        ),
                      ),
                      VerticalSpaceBox(4.h),
                      // Product title
                      SizedBox(
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
                          // Product brand logo
                          Icon(
                            CupertinoIcons.bag_fill,
                            size: 15.sp,
                            color: GHOST_COLOR,
                          ),
                          HorizontalSpaceBox(3.w),
                          Image.network(
                            product.brandLogo,
                            width: 30,
                            height: 30,
                          ),
                          HorizontalSpaceBox(20.w),
                          // Product price
                          Icon(
                            CupertinoIcons.tag_fill,
                            size: 15.sp,
                            color: GHOST_COLOR,
                          ),
                          HorizontalSpaceBox(3.w),
                          Text(
                            "\$${product.price}",
                            style: const TextStyle(color: PRIMARY_COLOR),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
