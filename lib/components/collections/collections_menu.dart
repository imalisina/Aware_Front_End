import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX package
import 'package:get/get.dart';
import 'package:sample/configs/route_names.dart';

// Other packages
import 'package:sample/configs/theme.dart';
import 'package:sample/packages/space_box_container.dart';

class CollectionsMenu extends StatelessWidget {
  const CollectionsMenu({super.key});

  // Collection menu titles
  static final List<String> collectionMenuTitle = <String>[
    "Relations",
    "Clothes",
    "Accessories",
    "Places",
  ];

  // Collection menu sub-titles
  static final List<String> collectionMenuSubTitle = <String>[
    "List of your friends",
    "List of uploaded clothes",
    "List of uploaded accessories",
    "List of your favourite places",
  ];

  // Collection menu icons
  static final List<IconData> collectionMenuIcons = <IconData>[
    Icons.diversity_3_rounded,
    Icons.inventory_2_rounded,
    Icons.watch_rounded,
    Icons.map_rounded,
  ];

  // Collection menu routes
  static final List<String> collectionMenuRoutes = <String>[
    relations,
    "",
    "",
    "",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500.h,
      padding: EdgeInsets.only(left: 30.w, right: 30.w),
      // Collection menu section
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.9.h,
          crossAxisCount: 2,
          mainAxisSpacing: 25.h,
          crossAxisSpacing: 15.w,
        ),
        itemCount: collectionMenuTitle.length,
        itemBuilder: (context, index) {
          final cardItemTitle = collectionMenuTitle[index];
          final cardItemSubTitle = collectionMenuSubTitle[index];
          final cardItemIcon = collectionMenuIcons[index];
          final cardItemRoute = collectionMenuRoutes[index];
          // Collection menu item
          return DottedBorder(
            borderType: BorderType.RRect,
            dashPattern: const [5, 0.1],
            radius: Radius.circular(10.r),
            color: GHOST_COLOR,
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              // Handling routing operation for each collection card item
              onPressed: () {
                Get.toNamed(cardItemRoute);
              },
              // Collection card item main component
              child: Column(
                children: [
                  VerticalSpaceBox(20.h),

                  // Collection card icon
                  Container(
                    alignment: Alignment.center,
                    child: Icon(
                      cardItemIcon,
                      size: 80.sp,
                    ),
                  ),

                  VerticalSpaceBox(10.h),

                  // Collection card title
                  Text(
                    cardItemTitle,
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        color: PRIMARY_COLOR),
                  ),

                  VerticalSpaceBox(4.h),

                  // Collection card sub-title
                  Text(
                    cardItemSubTitle,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: SECONDARY_COLOR,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
