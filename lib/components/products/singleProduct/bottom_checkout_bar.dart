import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher_string.dart';

// Other packages
import 'package:sample/configs/theme.dart';
import 'package:sample/packages/space_box_container.dart';

class BottomCheckoutBar extends StatelessWidget {
  // Define state for prodcut price
  final String itemPrice, itemUrl;
  // Getting state from other components
  // ignore: use_key_in_widget_constructors
  const BottomCheckoutBar(this.itemPrice, this.itemUrl);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: Container(
        margin: EdgeInsets.only(left: 10.w, right: 10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Item price
            Row(
              children: [
                const Icon(Icons.local_offer_rounded),
                HorizontalSpaceBox(5.w),
                Text(
                  "\$$itemPrice",
                  style: TextStyle(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                      color: SECONDARY_COLOR),
                ),
              ],
            ),

            // Checkout button
            CupertinoButton.filled(
              padding: EdgeInsets.only(
                  left: 40.w, right: 40.w, top: 10.h, bottom: 10.h),
              borderRadius: BorderRadius.circular(40.r),
              // Redirect user to selected product's URL
              onPressed: () async {
                await launchUrlString(
                  itemUrl,
                  mode: LaunchMode.externalApplication,
                );
              },
              child: Icon(
                Icons.shopping_cart_rounded,
                color: BACKGROUND_COLOR,
                size: 30.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
