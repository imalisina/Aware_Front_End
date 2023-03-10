import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Other packages
import 'package:sample/configs/route_names.dart';
import 'package:sample/packages/horizontal_card_button.dart';

class BookmarksMenu extends StatelessWidget {
  const BookmarksMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: Column(
        children: const [
          CardContent(
              "Saved Products", Icons.shopping_bag_rounded, bookmarkedProducts),
          Divider(),
          CardContent(
              "Saved Fashion Tips", Icons.view_sidebar_rounded, bookmarkedTips),
        ],
      ),
    );
  }
}
