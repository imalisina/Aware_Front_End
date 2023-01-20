import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX package
import 'package:get/get.dart';
import 'package:sample/screens/CompleteProfile/ProfileDetails/personal_details_controller.dart';

// Other packages
import 'package:sample/constants/constants.dart';
import 'package:sample/utils/space_box_container.dart';

class PersonalDetailsContent extends StatelessWidget {
  const PersonalDetailsContent({super.key});

  // Define personal details controller
  static final personalDetailsController = Get.put(PersonalDetailsController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30.w, right: 30.w),
      child: Column(
        children: [
          // BirthDate dropdown menu section
          SizedBox(
            child: Obx(
              () => Row(
                children: [
                  personalDetailsController.birthDateHasError.value
                      ? const Icon(
                          CupertinoIcons.clear_circled_solid,
                          color: ERROR_COLOR,
                        )
                      : const EmptyBox(),
                  HorizontalSpaceBox(
                      personalDetailsController.birthDateHasError.value
                          ? 4.w
                          : 0.w),
                  const Text(
                    "Birthdate : ",
                    style: TextStyle(color: INPUT_PLACEHOLDER),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Row(
                      children: [
                        Text(
                            style: personalDetailsController
                                    .birthDateHasError.value
                                ? dropDownStyleError
                                : dropDownStyleDefault,
                            !personalDetailsController.isDateSelected.value
                                ? "Select your birthdate"
                                : "${personalDetailsController.birthDay.value}/${personalDetailsController.birthMonth.value}/${personalDetailsController.birthYear.value}"),
                        HorizontalSpaceBox(7.w),
                        Icon(
                          CupertinoIcons.chevron_down,
                          size: 21.sp,
                          color:
                              personalDetailsController.birthDateHasError.value
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
                        child: CupertinoDatePicker(
                          backgroundColor: BACKGROUND_COLOR,
                          initialDateTime:
                              personalDetailsController.defaultDate,
                          maximumDate: DateTime.now(),
                          onDateTimeChanged: (DateTime newDate) {
                            personalDetailsController.storeBirthDate(newDate);
                          },
                          mode: CupertinoDatePickerMode.date,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          VerticalSpaceBox(10.h),

          // Gender drop down menu section
          SizedBox(
            child: Obx(
              () => Row(
                children: [
                  personalDetailsController.genderHasError.value
                      ? const Icon(
                          CupertinoIcons.clear_circled_solid,
                          color: ERROR_COLOR,
                        )
                      : const EmptyBox(),
                  HorizontalSpaceBox(
                      personalDetailsController.genderHasError.value
                          ? 4.w
                          : 0.w),
                  const Text(
                    "Gender : ",
                    style: TextStyle(color: INPUT_PLACEHOLDER),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Row(
                      children: [
                        Text(
                          style: personalDetailsController.genderHasError.value
                              ? dropDownStyleError
                              : dropDownStyleDefault,
                          !personalDetailsController.isGenderSelected.value
                              ? "Select your gender"
                              : personalDetailsController.genderName.value,
                        ),
                        HorizontalSpaceBox(7.w),
                        Icon(
                          CupertinoIcons.chevron_down,
                          size: 21.sp,
                          color: personalDetailsController.genderHasError.value
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
                        height: 250.h,
                        child: CupertinoPicker(
                          backgroundColor: BACKGROUND_COLOR,
                          itemExtent: 35.h,
                          scrollController: FixedExtentScrollController(),
                          children: List<Widget>.generate(
                            personalDetailsController.genders.length,
                            (int index) {
                              return Center(
                                child: Text(
                                    personalDetailsController.genders[index]),
                              );
                            },
                          ),
                          onSelectedItemChanged: (int value) {
                            personalDetailsController
                                .storeSelectedGenderID(value);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          VerticalSpaceBox(10.h),

          // Ethnicity drop down menu section
          SizedBox(
            child: Obx(
              () => Row(
                children: [
                  personalDetailsController.ethnicityHasError.value
                      ? const Icon(
                          CupertinoIcons.clear_circled_solid,
                          color: ERROR_COLOR,
                        )
                      : const EmptyBox(),
                  HorizontalSpaceBox(
                      personalDetailsController.genderHasError.value
                          ? 4.w
                          : 0.w),
                  const Text(
                    "Ethnicity : ",
                    style: TextStyle(color: INPUT_PLACEHOLDER),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Row(
                      children: [
                        Text(
                          style:
                              personalDetailsController.ethnicityHasError.value
                                  ? dropDownStyleError
                                  : dropDownStyleDefault,
                          !personalDetailsController.isEthnicitySelected.value
                              ? "Select your ethnicity"
                              : personalDetailsController.ethnicityName.value,
                        ),
                        HorizontalSpaceBox(7.w),
                        Icon(
                          CupertinoIcons.chevron_down,
                          size: 21.sp,
                          color:
                              personalDetailsController.ethnicityHasError.value
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
                        height: 250.h,
                        child: CupertinoPicker(
                          backgroundColor: BACKGROUND_COLOR,
                          itemExtent: 35.h,
                          scrollController: FixedExtentScrollController(),
                          children: List<Widget>.generate(
                            personalDetailsController.ethnicities.length,
                            (int index) {
                              return Center(
                                child: Text(personalDetailsController
                                    .ethnicities[index]),
                              );
                            },
                          ),
                          onSelectedItemChanged: (int value) {
                            personalDetailsController
                                .storeSelectedEthnicityID(value);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          VerticalSpaceBox(10.h),

          // Fashion styles drop down menu section
          SizedBox(
            child: Obx(
              () => Row(
                children: [
                  personalDetailsController.ethnicityHasError.value
                      ? const Icon(
                          CupertinoIcons.clear_circled_solid,
                          color: ERROR_COLOR,
                        )
                      : const EmptyBox(),
                  HorizontalSpaceBox(
                      personalDetailsController.genderHasError.value
                          ? 4.w
                          : 0.w),
                  const Text(
                    "Fashion style : ",
                    style: TextStyle(color: INPUT_PLACEHOLDER),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Row(
                      children: [
                        Text(
                          style: personalDetailsController
                                  .fashionStyleHasErrors.value
                              ? dropDownStyleError
                              : dropDownStyleDefault,
                          !personalDetailsController
                                  .isFashionStyleSelected.value
                              ? "Select favourite style"
                              : personalDetailsController
                                  .fashionStyleName.value,
                        ),
                        HorizontalSpaceBox(7.w),
                        Icon(
                          CupertinoIcons.chevron_down,
                          size: 21.sp,
                          color: personalDetailsController
                                  .fashionStyleHasErrors.value
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
                        height: 250.h,
                        child: CupertinoPicker(
                          backgroundColor: BACKGROUND_COLOR,
                          itemExtent: 35.h,
                          scrollController: FixedExtentScrollController(),
                          children: List<Widget>.generate(
                            personalDetailsController.fashionStyles.length,
                            (int index) {
                              return Center(
                                child: Text(personalDetailsController
                                    .fashionStyles[index]),
                              );
                            },
                          ),
                          onSelectedItemChanged: (int value) {
                            personalDetailsController
                                .storeSelectedFashionStyleID(value);
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

          // Weigth input field
          SizedBox(
            height: 55.h,
            child: CupertinoTextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                personalDetailsController.storeWeight(value);
              },
              placeholder: "Enter your weight : e.g. 30",
              prefix: Obx(
                () => personalDetailsController.weightHasError.value
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

          // Weight error handler widget
          Obx(
            () => personalDetailsController.weightHasError.value
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 6.h),
                        child: Text(
                          "Enter a valid weight !",
                          style: TextStyle(
                              color: ERROR_COLOR,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  )
                : const EmptyBox(),
          ),

          VerticalSpaceBox(20.h),

          // Height input field
          SizedBox(
            height: 55.h,
            child: CupertinoTextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                personalDetailsController.storeHeight(value);
              },
              placeholder: "Enter your height : e.g. 180",
              prefix: Obx(
                () => personalDetailsController.heightHasError.value
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
            ),
          ),

          // Height error handler widget
          Obx(
            () => personalDetailsController.heightHasError.value
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 6.h),
                        child: Text(
                          "Enter a valid height !",
                          style: TextStyle(
                              color: ERROR_COLOR,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  )
                : const EmptyBox(),
          ),

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
                    Get.toNamed("/complete/profile/location");
                  },
                ),
              ),
              HorizontalSpaceBox(12.w),
              SizedBox(
                  width: 170.w,
                  child: Obx(
                    () => CupertinoButton.filled(
                      child: personalDetailsController.spinnerStatus.value
                          ? const CupertinoActivityIndicator(
                              color: BACKGROUND_COLOR,
                            )
                          : const Text("Next"),
                      onPressed: () {
                        // Perform validation process
                        personalDetailsController.validateBirthDate();
                        personalDetailsController.validateGender();
                        personalDetailsController.validateEthnicity();
                        personalDetailsController.validateFashionStyle();
                        personalDetailsController.validateWeight();
                        personalDetailsController.validateHeight();
                        // Open redirection gateway
                        personalDetailsController.setAuthorized();

                        // Redirect to location details screen
                        if (personalDetailsController.hasPermission.isTrue) {
                          // Toggle method to display spinner during API calls
                          personalDetailsController.toggleLoading();
                          Timer(
                            const Duration(seconds: 3),
                            () {
                              personalDetailsController.toggleLoading();

                              // Redirection route
                              Get.toNamed("/complete/profile/location");
                            },
                          );
                        }
                      },
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
