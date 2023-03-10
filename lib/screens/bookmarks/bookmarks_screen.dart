import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Other packages
import 'package:sample/packages/navbars/navbar_with_back_button.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/packages/title_content.dart';
import 'package:sample/components/bookmarks/bookmarks_menu.dart';

class BookmarksScreen extends StatelessWidget {
  const BookmarksScreen({super.key});

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
                  "My bookmarks", "Which bookmark you want to see ?"),

              VerticalSpaceBox(40.h),

              // Bookmarks menu section
              const BookmarksMenu(),

              VerticalSpaceBox(80.h),

              // Bookmark image
              Container(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/images/bookmarks.gif",
                  width: 400.w,
                  height: 400.h,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
