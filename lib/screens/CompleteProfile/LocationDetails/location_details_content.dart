import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX package
import 'package:get/get.dart';
import 'package:sample/screens/completeProfile/Confirmation/profile_confirmation_screen.dart';
import 'package:sample/controllers/countrySelection/select_country_controller.dart';
import 'package:sample/controllers/completeProfile/location_details_controller.dart';

// Other package
import 'package:sample/configs/color_palette.dart';
import 'package:sample/packages/space_box_container.dart';

class LocationDetailsContent extends StatelessWidget {
  const LocationDetailsContent({super.key});

  // Define selected country controller
  static final selectedCountry = Get.put(SelectCountryController());
  // Define location details controller
  static final locationDetailsController = Get.put(LocationDetailsController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30.w, right: 30.w),
      child: Column(
        children: [
          // Country dropdown menu section
          SizedBox(
            child: Row(
              children: [
                const Text(
                  "Country : ",
                  style: TextStyle(color: INPUT_PLACEHOLDER),
                ),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: null,
                  child: Row(
                    children: [
                      Text(
                        style: dropDownStyleDefault,
                        selectedCountry.selectedCountryName,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),

          VerticalSpaceBox(10.h),

          // State dropdown menu section
          SizedBox(
            child: Obx(
              () => Row(
                children: [
                  locationDetailsController.stateHasError.value
                      ? const Icon(
                          CupertinoIcons.clear_circled_solid,
                          color: ERROR_COLOR,
                        )
                      : const EmptyBox(),
                  HorizontalSpaceBox(
                      locationDetailsController.stateHasError.value
                          ? 4.w
                          : 0.w),
                  const Text(
                    "State : ",
                    style: TextStyle(color: INPUT_PLACEHOLDER),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Row(
                      children: [
                        Text(
                          style: locationDetailsController.stateHasError.value
                              ? dropDownStyleError
                              : dropDownStyleDefault,
                          !locationDetailsController.isStateSelected.value
                              ? "Select your state"
                              : locationDetailsController.stateName.value,
                        ),
                        HorizontalSpaceBox(7.w),
                        Icon(
                          CupertinoIcons.chevron_down,
                          size: 21.sp,
                          color: locationDetailsController.stateHasError.value
                              ? ERROR_COLOR
                              : PRIMARY_COLOR,
                        ),
                      ],
                    ),

                    // Dropdown modal section
                    onPressed: () => showCupertinoModalPopup(
                      context: context,
                      builder: (_) => SizedBox(
                        width: double.maxFinite,
                        height: 400.h,
                        child: CupertinoPicker(
                          backgroundColor: BACKGROUND_COLOR,
                          itemExtent: 35.h,
                          scrollController: FixedExtentScrollController(),
                          children: List<Widget>.generate(
                            selectedCountry.selectedCountryStates.length,
                            (int index) {
                              return Center(
                                child: Text(
                                  selectedCountry.selectedCountryStates[index],
                                ),
                              );
                            },
                          ),
                          onSelectedItemChanged: (int value) {
                            locationDetailsController
                                .storeSelectedStateID(value);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          VerticalSpaceBox(20.h),

          // ZIP Code input field
          SizedBox(
            height: 55.h,
            child: CupertinoTextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                locationDetailsController.storeZipCode(value);
              },
              placeholder: "Enter your ZIP / Postal code",
              prefix: Obx(
                () => locationDetailsController.zipHasError.value
                    ? Container(
                        margin: EdgeInsets.only(left: 10.w),
                        child: const Icon(
                          CupertinoIcons.clear_thick_circled,
                          color: ERROR_COLOR,
                        ),
                      )
                    : const EmptyBox(),
              ),
              textInputAction: TextInputAction.next,
              placeholderStyle: inputPlaceholderStyle,
            ),
          ),

          Obx(
            () => locationDetailsController.zipHasError.value
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 6.h),
                        child: Text(
                          "Enter a valid ZIP Code",
                          style: TextStyle(
                              color: ERROR_COLOR,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  )
                : const EmptyBox(),
          ),

          VerticalSpaceBox(20.h),

          // Address input field
          SizedBox(
            height: 80.h,
            child: CupertinoTextField(
              keyboardType: TextInputType.text,
              onSubmitted: (value) {
                locationDetailsController.storeAddress(value);
              },
              placeholder: "Enter your home address",
              prefix: Obx(
                () => locationDetailsController.addressHasError.value
                    ? Container(
                        margin: EdgeInsets.only(left: 10.w),
                        child: const Icon(
                          CupertinoIcons.clear_thick_circled,
                          color: ERROR_COLOR,
                        ),
                      )
                    : const EmptyBox(),
              ),
              textInputAction: TextInputAction.done,
              placeholderStyle: inputPlaceholderStyle,
              maxLines: 5,
            ),
          ),

          // Address error handler widget
          Obx(() => locationDetailsController.addressHasError.value
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 6.h),
                      child: Text(
                        "Enter a valid address, it will be used in contests",
                        style: TextStyle(
                            color: ERROR_COLOR,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                )
              : const EmptyBox()),

          VerticalSpaceBox(20.h),

          // Buttons
          Row(
            children: [
              SizedBox(
                width: 170.w,
                child: CupertinoButton(
                  color: GHOST_COLOR,
                  child: const Text("Skip"),
                  onPressed: () {
                    Get.off(const ProfileConfirmationScreen());
                  },
                ),
              ),
              HorizontalSpaceBox(12.w),
              SizedBox(
                width: 170.w,
                child: Obx(
                  () => CupertinoButton.filled(
                    child: locationDetailsController.spinnerStatus.value
                        ? const CupertinoActivityIndicator(
                            color: BACKGROUND_COLOR,
                          )
                        : const Text("Next"),
                    onPressed: () {
                      // Perform validation process
                      locationDetailsController.validateState();
                      locationDetailsController.validateZipCode();
                      locationDetailsController.validateAddress();
                      // Open redirection gateway
                      locationDetailsController.setAuthorized();

                      // Redirect to profile confirmation screen
                      if (locationDetailsController.hasPermission.isTrue) {
                        // Togge method to display spinner during API calls
                        locationDetailsController.toggleLoading();
                        Timer(
                          const Duration(seconds: 3),
                          () {
                            locationDetailsController.toggleLoading();

                            // Redirection route
                            Get.off(const ProfileConfirmationScreen());
                          },
                        );
                      }
                    },
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
