import 'package:flutter/cupertino.dart';
import 'package:sample/configs/theme.dart';
import 'package:sample/services/dailyQuote/next_quote_loading.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX package
import 'package:get/get.dart';
import 'package:sample/controllers/dailyQuote/daily_quote_controller.dart';

// Other packages
import 'package:sample/services/dailyQuote/daily_quote_content.dart';
import 'package:sample/packages/icon_card_button.dart';
import 'package:sample/packages/space_box_container.dart';

class MiddleBoxSection extends StatelessWidget {
  const MiddleBoxSection({super.key});

  // Define daily quote controller
  static final dailyQuoteController = Get.put(DailyQuoteController());

  @override
  Widget build(BuildContext context) {
    // Define daily quote method
    dailyQuote() {
      dailyQuoteController.generateDailyQuote();
      showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) {
          return CupertinoPopupSurface(
            child: Container(
              color: BACKGROUND_COLOR,
              alignment: Alignment.center,
              width: double.maxFinite,
              height: 500.h,
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
                              "Today's Aware daily quote is ${dailyQuoteController.dailyQuote} from ${dailyQuoteController.dailyQuoteAuthor}");
                        },
                      ),
                    ],
                  ),
                  VerticalSpaceBox(30.h),
                  Obx(
                    () => dailyQuoteController.isLoading.isTrue ||
                            dailyQuoteController.isSelected.isTrue
                        ? const NextQuoteLoading()
                        : const DailyQuoteContent(),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    // Middle Box Section (main component)
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