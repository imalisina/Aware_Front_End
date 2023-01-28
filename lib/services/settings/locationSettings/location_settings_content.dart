import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX package
import 'package:get/get.dart';
import 'package:sample/controllers/location/location_controller.dart';

// Other packages
import 'package:sample/configs/theme.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/services/settings/locationSettings/edit_location_toggle.dart';

class LocationSettingsContent extends StatelessWidget {
  const LocationSettingsContent({super.key});

  // Define location details controller
  static final locationController = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30.w, right: 30.w),
      child: Column(
        children: [
          // Edit toggle button section main container
          const EditLocationToggle(),

          Obx(
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
              ],
            ),
          )
        ],
      ),
    );
  }
}
