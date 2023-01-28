import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Other packages
import 'package:sample/packages/navbars/navbar_with_back_button.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/components/products/allProducts/single_product_content.dart';

class SingleProductScreen extends StatelessWidget {
  const SingleProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(
        navigationBar: navbarWithBackButton,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(bottom: 20.h, left: 15.w, right: 15.w),
            child: Column(
              children: [
                VerticalSpaceBox(20.h),

                // Product details section
                const SingleProductContent(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
