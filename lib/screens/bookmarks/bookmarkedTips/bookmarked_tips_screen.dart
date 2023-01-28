import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// Other packages
import 'package:sample/configs/theme.dart';
import 'package:sample/packages/navbars/navbar_with_back_button.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/packages/title_content.dart';
import 'package:sample/services/bookmarks/bookmarkedTip/bookmarked_tips_list.dart';

class BookmarkedTipsScreen extends StatelessWidget {
  const BookmarkedTipsScreen({super.key});

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
              const TitleContent("Saved fashion tips",
                  "Here are your bookmarked fashion tips"),

              VerticalSpaceBox(40.h),

              // Bookmarked fashion tips list
              const BookmarkedTipsList(),
            ],
          ),
        ),
      ),
    );
  }
}
