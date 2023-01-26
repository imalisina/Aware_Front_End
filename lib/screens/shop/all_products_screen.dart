import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample/configs/theme.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/packages/title_content.dart';
import 'package:sample/services/products/all_products_list.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: BACKGROUND_COLOR,
          automaticallyImplyLeading: !disableBackButton,
          border: navigationBorder,
          padding: EdgeInsetsDirectional.only(top: 9.h),
          middle: Text(
            titleText,
            style: GoogleFonts.pacifico(
              color: MAIN_COLOR,
              fontSize: titleFontSize,
              fontWeight: titleFontWeight,
            ),
          ),
        ),
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VerticalSpaceBox(50.h),

              // Title and sub-title
              const TitleContent(
                  "Discounts", "Buy anything with special discount codes !"),

              VerticalSpaceBox(40.h),

              // All products list
              const AllProductsList(),
            ],
          ),
        ),
      ),
    );
  }
}
