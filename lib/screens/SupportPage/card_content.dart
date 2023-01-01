import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX package
import 'package:get/get.dart';

// Other packages
import 'package:sample/constants/constants.dart';
import 'package:sample/utils/space_box_container.dart';

class CardContent extends StatelessWidget {
  // Define variables to store the state
  final String cardContent, cardRoute;
  final IconData cardIcon;
  // Getting state from other components
  // ignore: use_key_in_widget_constructors
  const CardContent(this.cardContent, this.cardIcon, this.cardRoute);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        Get.toNamed(cardRoute);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              // Menu icon
              Icon(
                cardIcon,
                color: MAIN_COLOR,
                size: 25.sp,
              ),

              HorizontalSpaceBox(10.w),

              // Menu text
              Text(
                cardContent,
                style: TextStyle(color: PRIMARY_COLOR, fontSize: 17.sp),
              ),
            ],
          ),
          // Goto page arrow
          Icon(
            CupertinoIcons.chevron_forward,
            color: MAIN_COLOR,
            size: 25.sp,
          ),
        ],
      ),
    );
  }
}
