import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sample/controllers/fashionTip/fashion_tip_controller.dart';

class SingleFashionTipBody extends StatelessWidget {
  const SingleFashionTipBody({super.key});

  // Define fashion tip controller
  static final fashionTipController = Get.put(FashionTipController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        fashionTipController.fashionTipContent,
        style: TextStyle(height: 2.h),
      ),
    );
  }
}
