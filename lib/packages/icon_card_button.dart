import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Other packages
import 'package:sample/configs/theme.dart';
import 'package:sample/packages/space_box_container.dart';

class IconCardButton extends StatelessWidget {
  // Define icon and title
  final String title;
  final VoidCallback cardMethod;
  final IconData cardIcon;
  // Getting from other components
  // ignore: use_key_in_widget_constructors
  const IconCardButton(this.title, this.cardIcon, this.cardMethod);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          // Card button section
          child: CupertinoButton(
            padding: EdgeInsets.only(
                left: 30.w, right: 30.w, top: 20.h, bottom: 20.h),
            color: PRIMARY_COLOR,
            onPressed: cardMethod,
            child: Icon(
              cardIcon,
              color: BACKGROUND_COLOR,
              size: 35.sp,
            ),
          ),
        ),
        VerticalSpaceBox(3.h),
        // Card title section
        Text(
          title,
          style: TextStyle(
            color: PRIMARY_COLOR,
            fontSize: 16.sp,
            fontWeight: FontWeight.w300,
          ),
        )
      ],
    );
  }
}
