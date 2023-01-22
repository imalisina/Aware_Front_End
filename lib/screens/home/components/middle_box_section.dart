import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sample/configs/color_palette.dart';
import 'package:sample/packages/icon_card_button.dart';
import 'package:share_plus/share_plus.dart';

class MiddleBoxSection extends StatelessWidget {
  const MiddleBoxSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Define daily quote method
    dailyQuote() => showCupertinoModalPopup(
          context: context,
          builder: (BuildContext context) {
            return CupertinoPopupSurface(
              child: Container(
                color: BACKGROUND_COLOR,
                alignment: Alignment.center,
                width: double.maxFinite,
                height: 600.h,
                child: Column(
                  children: [
                    // Popup header section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Close button - Left side
                        CupertinoButton(
                          child: const Text(
                            "Close",
                            style: TextStyle(color: SECONDARY_COLOR),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        // Popup title - Center
                        Text(
                          "Daily Quote",
                          style: TextStyle(
                              fontSize: 25.sp, fontWeight: FontWeight.w500),
                        ),
                        // Share button - Right side
                        CupertinoButton(
                          child: Icon(
                            CupertinoIcons.share_solid,
                            color: PRIMARY_COLOR,
                            size: 22.sp,
                          ),
                          onPressed: () {
                            Share.share(
                              // ADD THE QUOTE AND OTHER DETAILS....
                                "Aware Daily Quote : ");
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // Daily Quote button
        IconCardButton(
            "Daily Quote", CupertinoIcons.gift_fill, () => dailyQuote()),
        IconCardButton(
            "Discounts", CupertinoIcons.tickets_fill, () => Get.toNamed("")),
        IconCardButton(
            "Bookmarks", CupertinoIcons.bookmark_fill, () => Get.toNamed("")),
      ],
    );
  }
}
