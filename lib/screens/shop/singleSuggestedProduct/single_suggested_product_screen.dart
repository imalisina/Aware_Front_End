import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Other packages
import 'package:sample/packages/navbars/navbar_with_back_button.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/components/products/suggestedProducts/singleSuggestedProduct/single_suggested_product_content.dart';

class SingleSuggestedProductScreen extends StatelessWidget {
  const SingleSuggestedProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(
        navigationBar: navbarWithBackButton,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(bottom: 20.h, left: 15.w, right: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                VerticalSpaceBox(20.h),

                // Product details section
                const SingleSuggestedProductContent(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
