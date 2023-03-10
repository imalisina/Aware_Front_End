import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX package
import 'package:get/get.dart';
import 'package:sample/app/app_container.dart';
import 'package:sample/controllers/completeProfile/profile_confirmation_controller.dart';

// Other packages
import 'package:sample/configs/theme.dart';
import 'package:sample/packages/flush_bar_method.dart';
import 'package:sample/packages/navbars/navbar_without_back_button.dart';
import 'package:sample/packages/space_box_container.dart';

class ProfileConfirmationScreen extends StatelessWidget {
  const ProfileConfirmationScreen({super.key});

  // Define profile confirmation controller
  static final profileConfirmationController =
      Get.put(ProfileConfirmationController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(
        navigationBar: navbarWithoutBackButton,
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              VerticalSpaceBox(50.h),

              // Title
              Text(
                "Thank you",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 32.sp,
                    color: PRIMARY_COLOR),
              ),

              VerticalSpaceBox(5.h),

              // Sub-title
              SizedBox(
                width: 300.w,
                child: Text(
                  "Your details will be processed & validated by Aware team",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 16.sp,
                      height: 1.6.h,
                      color: SECONDARY_COLOR),
                ),
              ),

              // Thank you illustrator
              Image.asset(
                "assets/images/thanks.gif",
                width: 500.w,
                height: 500.h,
              ),

              // Redirection button section
              SizedBox(
                width: 280.w,
                child: Obx(
                  () => CupertinoButton.filled(
                    onPressed: () {
                      profileConfirmationController.toggleLoading();
                      if (profileConfirmationController.loadingStatus.isTrue) {
                        Timer(
                          const Duration(milliseconds: 150),
                          () {
                            Get.off(const AppContainer());
                            showSnackBar(context,
                                "Welcome to Aware, Let's start your digital life !");
                          },
                        );
                      }
                    },
                    child: profileConfirmationController.loadingStatus.value
                        ? const CupertinoActivityIndicator(
                            color: BACKGROUND_COLOR,
                          )
                        : const Text("Explore Aware"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
