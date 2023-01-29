import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX packages
import 'package:get/get.dart';
import 'package:sample/components/settings/accountSettings/locationSettings/validate_location_details_button.dart';

// Other packages
import 'package:sample/configs/theme.dart';
import 'package:sample/controllers/settings/locationSettings/location_settings_controller.dart';
import 'package:sample/packages/space_box_container.dart';

class EnabledLocationInputs extends StatelessWidget {
  const EnabledLocationInputs({super.key});

  // Define location settings controller
  static final locationSettingsController =
      Get.put(LocationSettingsController());

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
                          locationSettingsController.selectedCountryName,
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
                  locationSettingsController.stateHasError.value
                      ? const Icon(
                          CupertinoIcons.clear_circled_solid,
                          color: ERROR_COLOR,
                        )
                      : const EmptyBox(),
                  HorizontalSpaceBox(
                      locationSettingsController.stateHasError.value
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
                          style: locationSettingsController.stateHasError.value
                              ? dropDownStyleError
                              : dropDownStyleDefault,
                          !locationSettingsController.isStateSelected.value
                              ? "Select your state"
                              : locationSettingsController.stateName.value,
                        ),
                        HorizontalSpaceBox(7.w),
                        Icon(
                          CupertinoIcons.chevron_down,
                          size: 21.sp,
                          color: locationSettingsController.stateHasError.value
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
                            locationSettingsController
                                .selectedCountryStates.length,
                            (int index) {
                              return Center(
                                child: Text(
                                  locationSettingsController
                                      .selectedCountryStates[index],
                                ),
                              );
                            },
                          ),
                          onSelectedItemChanged: (int value) {
                            locationSettingsController
                                .storeSelectedStateID(value);
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
                  locationSettingsController.storeZipCode(value);
                },
                placeholder: locationSettingsController.zip.isEmpty
                    ? "Enter your ZIP code"
                    : "Enter new ZIP code",
                prefix: locationSettingsController.zipHasError.value
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

            locationSettingsController.zipHasError.value
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
                onChanged: (value) {
                  locationSettingsController.storeAddress(value);
                },
                placeholder: locationSettingsController.address.isEmpty
                    ? "Enter your home address"
                    : "Enter new address",
                prefix: locationSettingsController.addressHasError.value
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
            locationSettingsController.addressHasError.value
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
