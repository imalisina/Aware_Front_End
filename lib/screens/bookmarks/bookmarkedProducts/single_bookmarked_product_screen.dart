import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Other packages
import 'package:sample/packages/navbars/navbar_with_back_button.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/services/bookmarks/bookmarkedProduct/single_bookmarked_product_content.dart';

class SingleBookmarkedProductScreen extends StatelessWidget {
  const SingleBookmarkedProductScreen({super.key});

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

                // Bookmarked product details section
                const SingleBookmarkedProductContent(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
