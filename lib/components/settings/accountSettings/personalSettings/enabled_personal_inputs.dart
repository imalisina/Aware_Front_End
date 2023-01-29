import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX packages
import 'package:get/get.dart';
import 'package:sample/controllers/settings/personalSettings/personal_settings_controller.dart';

// Other packages
import 'package:sample/configs/theme.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/components/settings/accountSettings/personalSettings/validate_personal_details_button.dart';

class EnabledPersonalInputs extends StatelessWidget {
  const EnabledPersonalInputs({super.key});

  // Define personal settings controller
  static final personalSettingsController =
      Get.put(PersonalSettingsController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Obx(
        () => Column(
          children: [
            // BirthDate dropdown menu section
            SizedBox(
              child: Row(
                children: [
                  personalSettingsController.birthDateHasError.value
                      ? const Icon(
                          CupertinoIcons.clear_circled_solid,
                          color: ERROR_COLOR,
                        )
                      : const EmptyBox(),
                  HorizontalSpaceBox(
                      personalSettingsController.birthDateHasError.value
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
                            style: personalSettingsController
                                    .birthDateHasError.value
                                ? dropDownStyleError
                                : dropDownStyleDefault,
                            !personalSettingsController.isDateSelected.value
                                ? "Select your birthdate"
                                : "${personalSettingsController.birthDay.value}/${personalSettingsController.birthMonth.value}/${personalSettingsController.birthYear.value}"),
                        HorizontalSpaceBox(7.w),
                        Icon(
                          CupertinoIcons.chevron_down,
                          size: 21.sp,
                          color:
                              personalSettingsController.birthDateHasError.value
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
                              personalSettingsController.defaultDate,
                          maximumDate: DateTime.now(),
                          onDateTimeChanged: (DateTime newDate) {
                            personalSettingsController.storeBirthDate(newDate);
                          },
                          mode: CupertinoDatePickerMode.date,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            VerticalSpaceBox(10.h),

            // Gender drop down menu section
            SizedBox(
              child: Row(
                children: [
                  personalSettingsController.genderHasError.value
                      ? const Icon(
                          CupertinoIcons.clear_circled_solid,
                          color: ERROR_COLOR,
                        )
                      : const EmptyBox(),
                  HorizontalSpaceBox(
                      personalSettingsController.genderHasError.value
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
                          style: personalSettingsController.genderHasError.value
                              ? dropDownStyleError
                              : dropDownStyleDefault,
                          !personalSettingsController.isGenderSelected.value
                              ? "Select your gender"
                              : personalSettingsController.genderName.value,
                        ),
                        HorizontalSpaceBox(7.w),
                        Icon(
                          CupertinoIcons.chevron_down,
                          size: 21.sp,
                          color: personalSettingsController.genderHasError.value
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
                            personalSettingsController.genders.length,
                            (int index) {
                              return Center(
                                child: Text(
                                    personalSettingsController.genders[index]),
                              );
                            },
                          ),
                          onSelectedItemChanged: (int value) {
                            personalSettingsController
                                .storeSelectedGenderID(value);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            VerticalSpaceBox(10.h),

            // Ethnicity drop down menu section
            SizedBox(
              child: Row(
                children: [
                  personalSettingsController.ethnicityHasError.value
                      ? const Icon(
                          CupertinoIcons.clear_circled_solid,
                          color: ERROR_COLOR,
                        )
                      : const EmptyBox(),
                  HorizontalSpaceBox(
                      personalSettingsController.genderHasError.value
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
                              personalSettingsController.ethnicityHasError.value
                                  ? dropDownStyleError
                                  : dropDownStyleDefault,
                          !personalSettingsController.isEthnicitySelected.value
                              ? "Select your ethnicity"
                              : personalSettingsController.ethnicityName.value,
                        ),
                        HorizontalSpaceBox(7.w),
                        Icon(
                          CupertinoIcons.chevron_down,
                          size: 21.sp,
                          color:
                              personalSettingsController.ethnicityHasError.value
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
                            personalSettingsController.ethnicities.length,
                            (int index) {
                              return Center(
                                child: Text(personalSettingsController
                                    .ethnicities[index]),
                              );
                            },
                          ),
                          onSelectedItemChanged: (int value) {
                            personalSettingsController
                                .storeSelectedEthnicityID(value);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            VerticalSpaceBox(10.h),

            // Fashion styles drop down menu section
            SizedBox(
              child: Row(
                children: [
                  personalSettingsController.ethnicityHasError.value
                      ? const Icon(
                          CupertinoIcons.clear_circled_solid,
                          color: ERROR_COLOR,
                        )
                      : const EmptyBox(),
                  HorizontalSpaceBox(
                      personalSettingsController.genderHasError.value
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
                          style: personalSettingsController
                                  .fashionStyleHasErrors.value
                              ? dropDownStyleError
                              : dropDownStyleDefault,
                          !personalSettingsController
                                  .isFashionStyleSelected.value
                              ? "Select favourite style"
                              : personalSettingsController
                                  .fashionStyleName.value,
                        ),
                        HorizontalSpaceBox(7.w),
                        Icon(
                          CupertinoIcons.chevron_down,
                          size: 21.sp,
                          color: personalSettingsController
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
                            personalSettingsController.fashionStyles.length,
                            (int index) {
                              return Center(
                                child: Text(personalSettingsController
                                    .fashionStyles[index]),
                              );
                            },
                          ),
                          onSelectedItemChanged: (int value) {
                            personalSettingsController
                                .storeSelectedFashionStyleID(value);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            VerticalSpaceBox(20.h),

            // Name input field
            SizedBox(
              height: 55.h,
              child: CupertinoTextField(
                keyboardType: TextInputType.name,
                onChanged: (value) {
                  personalSettingsController.storeName(value);
                },
                placeholder: personalSettingsController.name.isEmpty
                    ? "Enter your full name"
                    : "Enter new name",
                prefix: personalSettingsController.nameHasError.value
                    ? Container(
                        margin: EdgeInsets.only(left: 10.w),
                        child: const Icon(
                          CupertinoIcons.clear_thick_circled,
                          color: ERROR_COLOR,
                        ),
                      )
                    : const EmptyBox(),
                textInputAction: TextInputAction.next,
                placeholderStyle: inputPlaceholderStyle,
              ),
            ),

            // Name error handler widget
            personalSettingsController.nameHasError.value
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 6.h),
                        child: Text(
                          "Enter a valid name !",
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

            // Weigth input field
            SizedBox(
              height: 55.h,
              child: CupertinoTextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  personalSettingsController.storeWeight(value);
                },
                // ignore: unrelated_type_equality_checks
                placeholder: personalSettingsController.weight.isEmpty
                    ? "Enter your weight : e.g. 30"
                    : "Enter new weight",
                prefix: personalSettingsController.weightHasError.value
                    ? Container(
                        margin: EdgeInsets.only(left: 10.w),
                        child: const Icon(
                          CupertinoIcons.clear_thick_circled,
                          color: ERROR_COLOR,
                        ),
                      )
                    : const EmptyBox(),
                textInputAction: TextInputAction.next,
                placeholderStyle: inputPlaceholderStyle,
              ),
            ),

            // Weight error handler widget
            personalSettingsController.weightHasError.value
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

            VerticalSpaceBox(20.h),

            // Height input field
            SizedBox(
              height: 55.h,
              child: CupertinoTextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  personalSettingsController.storeHeight(value);
                },
                placeholder: personalSettingsController.height.isEmpty
                    ? "Enter your height : e.g. 180"
                    : "Enter new height",
                prefix: personalSettingsController.heightHasError.value
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

            // Height error handler widget
            personalSettingsController.heightHasError.value
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

            VerticalSpaceBox(20.h),

            // Validate updated personal details
            const ValidatePersonalDetailsButton(),
          ],
        ),
      ),
    );
  }
}
