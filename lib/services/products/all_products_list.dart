import 'package:flutter/cupertino.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX packages
import 'package:get/get.dart';
import 'package:sample/controllers/product/products_controller.dart';

// Other packages
import 'package:sample/configs/route_names.dart';
import 'package:sample/configs/theme.dart';
import 'package:sample/models/products.dart';
import 'package:sample/packages/space_box_container.dart';

class AllProductsList extends StatelessWidget {
  const AllProductsList({super.key});

  // Define products controller
  static final productsController = Get.put(ProductsController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15.w, right: 15.w),
      height: 670.h,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.9.h,
          crossAxisCount: 2,
          mainAxisSpacing: 15.h,
          crossAxisSpacing: 15.w,
        ),
        itemCount: Products().products.length,
        itemBuilder: (context, index) {
          final product = Products().products[index];
          return CupertinoButton(
            padding: EdgeInsets.zero,
            // Store selected product's index and handle routing
            onPressed: () {
              productsController.storeSelectedProduct(index);
              Get.toNamed(singleProduct);
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
                      tag: product.productId,
                      child: Image.network(
                        product.productImage,
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
                      product.title,
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
                        product.brandLogo,
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
