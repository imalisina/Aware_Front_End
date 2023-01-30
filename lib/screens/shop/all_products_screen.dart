import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX packages
import 'package:get/get.dart';
import 'package:sample/controllers/product/products_controller.dart';

// Other packages
import 'package:sample/packages/title_content.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/packages/navbars/navbar_with_back_button.dart';
import 'package:sample/components/products/allProducts/all_products_list.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key});

  // Define all products controller
  static final productsController = Get.put(ProductsController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(
        navigationBar: navbarWithBackButton,
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VerticalSpaceBox(50.h),

              // Title and sub-title
              const TitleContent(
                  "Discounts", "Buy anything with special discount codes !"),

              VerticalSpaceBox(30.h),

              // All products list
              const AllProductsList(),
            ],
          ),
        ),
      ),
    );
  }
}
