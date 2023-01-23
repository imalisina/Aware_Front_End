import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample/configs/theme.dart';
import 'package:sample/models/fashion_tips.dart';
import 'package:sample/packages/space_box_container.dart';

class FashionTipsList extends StatelessWidget {
  const FashionTipsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        itemCount: FashionTips().fashionTips.length,
        separatorBuilder: (context, _) => VerticalSpaceBox(10.h),
        itemBuilder: (context, index) {
          var fashionTip = FashionTips().fashionTips[index];
          return CupertinoButton(
            onPressed: () {},
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Fashion Tip main card
                  DottedBorder(
                    borderType: BorderType.RRect,
                    dashPattern: const [5, 0.1],
                    radius: Radius.circular(3.r),
                    color: GHOST_COLOR,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Fashion tip image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: Hero(
                            tag: index,
                            child: Image.network(
                              fashionTip.tipImage,
                              width: 100.w,
                              height: 100.h,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 200.w,
                              child: Text(
                                fashionTip.title,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: const TextStyle(color: PRIMARY_COLOR),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
