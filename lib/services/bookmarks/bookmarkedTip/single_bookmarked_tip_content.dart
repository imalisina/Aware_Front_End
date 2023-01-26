import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Other packages
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/services/bookmarks/bookmarkedTip/singleBookmarkedTipComponents/single_bookmarked_tip_banner.dart';
import 'package:sample/services/bookmarks/bookmarkedTip/singleBookmarkedTipComponents/single_bookmarked_tip_body.dart';
import 'package:sample/services/bookmarks/bookmarkedTip/singleBookmarkedTipComponents/single_bookmarked_tip_footer.dart';
import 'package:sample/services/bookmarks/bookmarkedTip/singleBookmarkedTipComponents/single_bookmarked_tip_header.dart';

class SingleBookmarkedTipContent extends StatelessWidget {
  const SingleBookmarkedTipContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.w),
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Fashion tip header
          const SingleBookmarkedTipHeader(),

          VerticalSpaceBox(15.h),

          // Fashion tip image banner
          const SingleBookmarkedTipBanner(),

          VerticalSpaceBox(10.h),

          // Fashion tip content
          const SingleBookmarkedTipBody(),

          VerticalSpaceBox(25.h),

          // Fashion tip footer
          const SingleBookmarkedTipFooter(),
        ],
      ),
    );
  }
}
