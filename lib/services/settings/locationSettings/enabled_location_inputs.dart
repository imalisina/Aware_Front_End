import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX packages
import 'package:get/get.dart';
import 'package:sample/controllers/location/location_controller.dart';

// Other packages
import 'package:sample/configs/theme.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/services/settings/locationSettings/validate_location_details_button.dart';

class EnabledLocationInputs extends StatelessWidget {
  const EnabledLocationInputs({super.key});

  // Define location controller
  static final locationController = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Obx(
        () => Column(
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
                          locationController.selectedCountryName,
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
              child: Row(
                children: [
                  locationController.stateHasError.value
                      ? const Icon(
                          CupertinoIcons.clear_circled_solid,
                          color: ERROR_COLOR,
                        )
                      : const EmptyBox(),
                  HorizontalSpaceBox(
                      locationController.stateHasError.value ? 4.w : 0.w),
                  const Text(
                    "State : ",
                    style: TextStyle(color: INPUT_PLACEHOLDER),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Row(
                      children: [
                        Text(
                          style: locationController.stateHasError.value
                              ? dropDownStyleError
                              : dropDownStyleDefault,
                          !locationController.isStateSelected.value
                              ? "Select your state"
                              : locationController.stateName.value,
                        ),
                        HorizontalSpaceBox(7.w),
                        Icon(
                          CupertinoIcons.chevron_down,
                          size: 21.sp,
                          color: locationController.stateHasError.value
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
                            locationController.selectedCountryStates.length,
                            (int index) {
                              return Center(
                                child: Text(
                                  locationController
                                      .selectedCountryStates[index],
                                ),
                              );
                            },
                          ),
                          onSelectedItemChanged: (int value) {
                            locationController.storeSelectedStateID(value);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            VerticalSpaceBox(20.h),

            // ZIP Code input field
            SizedBox(
              height: 55.h,
              child: CupertinoTextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  locationController.storeZipCode(value);
                },
                placeholder: locationController.zip.isEmpty
                    ? "Enter your ZIP / Postal code"
                    : locationController.zip.value,
                prefix: locationController.zipHasError.value
                    ? Container(
                        margin: EdgeInsets.only(left: 10.w),
                        child: const Icon(
                          CupertinoIcons.clear_thick_circled,
                          color: ERROR_COLOR,
                        ),
                      )
                    : const EmptyBox(),
                textInputAction: TextInputAction.done,
                placeholderStyle: inputPlaceholderStyle,
              ),
            ),

            locationController.zipHasError.value
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
                      ),
                    ],
                  )
                : const EmptyBox(),

            VerticalSpaceBox(20.h),

            // Address input field
            SizedBox(
              height: 80.h,
              child: CupertinoTextField(
                keyboardType: TextInputType.text,
                onSubmitted: (value) {
                  locationController.storeAddress(value);
                },
                placeholder: locationController.address.isEmpty
                    ? "Enter your home address"
                    : locationController.address.value,
                prefix: locationController.addressHasError.value
                    ? Container(
                        margin: EdgeInsets.only(left: 10.w),
                        child: const Icon(
                          CupertinoIcons.clear_thick_circled,
                          color: ERROR_COLOR,
                        ),
                      )
                    : const EmptyBox(),
                textInputAction: TextInputAction.done,
                placeholderStyle: inputPlaceholderStyle,
                maxLines: 5,
              ),
            ),

            // Address error handler widget
            locationController.addressHasError.value
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
                : const EmptyBox(),

            VerticalSpaceBox(20.h),

            // Validate updated location details
            const ValidateLocationDetailsButton(),
          ],
        ),
      ),
    );
  }
}
