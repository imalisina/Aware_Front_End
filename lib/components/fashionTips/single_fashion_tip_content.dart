import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/components/fashionTips/singleTipComponents/single_tip_banner.dart';
import 'package:sample/components/fashionTips/singleTipComponents/single_tip_body.dart';
import 'package:sample/components/fashionTips/singleTipComponents/single_tip_footer.dart';

// Other packages
import 'package:sample/components/fashionTips/singleTipComponents/single_tip_header.dart';

class SingleFashionTipContent extends StatelessWidget {
  const SingleFashionTipContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.w),
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Fashion tip header
          const SingleFashionTipHeader(),

          VerticalSpaceBox(15.h),

          // Fashion tip image banner
          const SingleFashionTipBanner(),

          VerticalSpaceBox(10.h),

          // Fashion tip content
          const SingleFashionTipBody(),

          VerticalSpaceBox(25.h),

          // Fashion tip footer
          const SingleFashionTipFooter(),
        ],
      ),
    );
  }
}
