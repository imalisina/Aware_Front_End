import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sample/configs/theme.dart';
import 'package:sample/controllers/user/user_controller.dart';
import 'package:sample/packages/space_box_container.dart';

class SettingsHeader extends StatelessWidget {
  const SettingsHeader({super.key});

  // Define user controller
  static final userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
      width: 500.w,
      child: Row(
        // User avatar
        children: [
          DottedBorder(
            borderType: BorderType.Circle,
            strokeWidth: 2.5.w,
            dashPattern: const [5, 1.5],
            color: GHOST_COLOR,
            child: Container(
              margin: EdgeInsets.only(
                  left: 10.w, right: 10.w, top: 10.h, bottom: 10.h),
              child: Icon(
                CupertinoIcons.person_fill,
                color: INPUT_PLACEHOLDER,
                size: 45.sp,
              ),
            ),
          ),

          // User fullname and birthday counter
          Container(
            margin: EdgeInsets.only(left: 12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Fullname section
                SizedBox(
                  width: 260.w,
                  child: Text(
                    userController.appUser.fullName,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style:
                        TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w600),
                  ),
                ),

                VerticalSpaceBox(5.h),

                // Birthday counter section
                Row(
                  children: [
                    Icon(
                      CupertinoIcons.rosette,
                      size: 22.sp,
                      color: INPUT_PLACEHOLDER,
                    ),
                    HorizontalSpaceBox(5.w),
                    SizedBox(
                      width: 240.w,
                      child: Text(
                        "${userController.daysLeft} days left for your birthday !",
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 15.sp, color: INPUT_PLACEHOLDER),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
