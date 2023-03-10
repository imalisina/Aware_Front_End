import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Other packages
import 'package:sample/packages/navbars/navbar_with_back_button.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/packages/title_content.dart';
import 'package:sample/components/bookmarks/bookmarkedProduct/bookmarked_products_list.dart';

class BookmarkedProductsScreen extends StatelessWidget {
  const BookmarkedProductsScreen({super.key});

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
                  "Saved products", "Here are your bookmarked products"),

              VerticalSpaceBox(40.h),

              // Bookmarked products list
              const BookmarkedProductsList(),
            ],
          ),
        ),
      ),
    );
  }
}
