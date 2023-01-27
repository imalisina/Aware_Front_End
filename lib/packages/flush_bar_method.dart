import 'package:flutter/cupertino.dart';
import 'package:flutter_flushbar/flutter_flushbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample/configs/theme.dart';

// Snackbar method
void showSnackBar(BuildContext widgetContext, String snackBarMessage) =>
    Flushbar(
      duration: const Duration(seconds: 5),
      title: "Aware",
      message: snackBarMessage,
      backgroundColor: PRIMARY_COLOR,
      icon: const Icon(
        CupertinoIcons.checkmark_alt_circle_fill,
        color: MAIN_COLOR,
      ),
      borderRadius: BorderRadius.circular(10.r),
      margin: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 5.h),
      flushbarPosition: FlushbarPosition.BOTTOM,
    )..show(widgetContext);
