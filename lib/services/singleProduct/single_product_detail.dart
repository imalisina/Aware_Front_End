import 'dart:async';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sample/configs/theme.dart';
import 'package:sample/controllers/product/product_controller.dart';
import 'package:sample/packages/space_box_container.dart';

class SingleProductDetail extends StatelessWidget {
  // Define a list of product detail titles
  static final List<String> detailTitle = <String>[
    "Brand",
    "Market",
    "Category",
    "Discount code"
  ];
  // Define states for product details
  final String productDetail;
  final int detailTitleIndex;
  // Getting states from other components
  // ignore: use_key_in_widget_constructors
  const SingleProductDetail(this.productDetail, this.detailTitleIndex);

  // Define product controller
  static final productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        children: [
          Row(
            children: [
              // Product brand
              Text(
                "${detailTitle[detailTitleIndex]} : ",
                style: TextStyle(color: INPUT_PLACEHOLDER, fontSize: 18.sp),
              ),
              Expanded(
                child: Text(
                  productDetail,
                  style: TextStyle(fontSize: 18.sp),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),

              // Checking whether the detail is marketUrl or not
              detailTitleIndex == 1
                  ? Icon(
                      CupertinoIcons.checkmark_seal_fill,
                      size: 18.sp,
                    )
                  : const EmptyBox(),

              // Checking whether the detail is discount code or not
              detailTitleIndex == 3
                  ? CupertinoButton(
                      padding: EdgeInsets.zero,
                      child: Obx(
                        () => Icon(
                          productController.isCopied.isFalse
                              ? CupertinoIcons.doc_on_clipboard_fill
                              : CupertinoIcons.checkmark_alt_circle_fill,
                          color: productController.isCopied.isFalse
                              ? GHOST_COLOR
                              : AGREE_COLOR,
                        ),
                      ),
                      onPressed: () {
                        FlutterClipboard.copy(productDetail);
                        productController.setCopied();

                        Timer(
                          const Duration(seconds: 1),
                          () {
                            productController.openCopyButton();
                          },
                        );
                      },
                    )
                  : const EmptyBox(),
            ],
          ),
          const Divider(),
          VerticalSpaceBox(10.h),
        ],
      ),
    );
  }
}
