import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX package
import 'package:get/get.dart';
import 'package:sample/controllers/dailyQuote/daily_quote_controller.dart';

// Other packages
import 'package:sample/configs/theme.dart';
import 'package:sample/packages/space_box_container.dart';

class DailyQuoteContent extends StatelessWidget {
  const DailyQuoteContent({super.key});

  // Define daily quote controller
  static final dailyQuoteController = Get.put(DailyQuoteController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(left: 15.w, right: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Quote title
            Text(
              dailyQuoteController.dailyQuoteTitle,
              style: TextStyle(
                color: MAIN_COLOR,
                fontSize: 25.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            VerticalSpaceBox(15.h),
            // Quote content
            Text(
              "\"${dailyQuoteController.dailyQuote}\"",
              style: TextStyle(color: PRIMARY_COLOR, fontSize: 20.sp),
            ),
            VerticalSpaceBox(10.h),
            // Quote source
            Text(
              "from ${dailyQuoteController.dailyQuoteAuthor}",
              style: TextStyle(
                color: INPUT_PLACEHOLDER,
                fontStyle: FontStyle.italic,
                fontSize: 15.sp,
              ),
            ),

            VerticalSpaceBox(80.h),

            // Feedback buttons section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List<Widget>.generate(
                dailyQuoteController.emojiNames.length,
                (int index) {
                  return Obx(
                    () => DottedBorder(
                      borderType: BorderType.Circle,
                      color: dailyQuoteController.feedbackID.value == index
                          ? MAIN_COLOR
                          : INPUT_PLACEHOLDER,
                      dashPattern: const [6, 6],
                      strokeWidth:
                          dailyQuoteController.feedbackID.value == index
                              ? 4.w
                              : 1.w,
                      child: CupertinoButton(
                        borderRadius: BorderRadius.circular(60.r),
                        onPressed:
                            dailyQuoteController.feedbackID.value != index
                                ? () {
                                    dailyQuoteController.storeFeedbackID(index);
                                    Timer(
                                      const Duration(milliseconds: 150),
                                      () => {
                                        Navigator.of(context).pop(),
                                      },
                                    );
                                  }
                                : null,
                        child: Image.asset(
                          "assets/images/emoji/${dailyQuoteController.emojiNames[index]}.gif",
                          width: 65.w,
                          height: 65.w,
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
