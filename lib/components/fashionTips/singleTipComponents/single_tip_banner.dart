import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sample/controllers/fashionTip/fashion_tip_controller.dart';

class SingleFashionTipBanner extends StatelessWidget {
  const SingleFashionTipBanner({super.key});

  // Define fashion tip controller
  static final fashionTipController = Get.put(FashionTipController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // Fashion tip image
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: Hero(
          tag: fashionTipController.fashionTipLikes,
          child: Image.network(
            fashionTipController.fashionTipImageUrl,
            width: 400.w,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
