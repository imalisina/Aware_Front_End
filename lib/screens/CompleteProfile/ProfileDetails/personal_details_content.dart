import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sample/constants/constants.dart';
import 'package:sample/screens/CompleteProfile/ProfileDetails/personal_details_controller.dart';
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
            child: Row(
              children: [
                const Text(
                  "Birthdate : ",
                  style: TextStyle(color: INPUT_PLACEHOLDER),
                ),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: Row(
                    children: [
                      Obx(
                        () => Text(!personalDetailsController
                                .isDateSelected.value
                            ? "Select the birthdate"
                            : "${personalDetailsController.birthDay.value}/${personalDetailsController.birthMonth.value}/${personalDetailsController.birthYear.value}"),
                      ),
                      HorizontalSpaceBox(10.w),
                      Icon(
                        CupertinoIcons.chevron_down,
                        size: 21.sp,
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
                        initialDateTime: personalDetailsController.defaultDate,
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

          VerticalSpaceBox(10.h),

          // Gender drop down menu section
          SizedBox(
            child: Row(
              children: [
                const Text(
                  "Gender : ",
                  style: TextStyle(color: INPUT_PLACEHOLDER),
                ),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: Row(
                    children: [
                      Obx(
                        () => Text(
                          !personalDetailsController.isGenderSelected.value
                              ? "Select your gender"
                              : personalDetailsController.genderName.value,
                        ),
                      ),
                      HorizontalSpaceBox(10.w),
                      Icon(
                        CupertinoIcons.chevron_down,
                        size: 21.sp,
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

          VerticalSpaceBox(10.h),

          // Ethnicity drop down menu section
          SizedBox(
            child: Row(
              children: [
                const Text(
                  "Ethnicity : ",
                  style: TextStyle(color: INPUT_PLACEHOLDER),
                ),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: Row(
                    children: [
                      Obx(
                        () => Text(
                          !personalDetailsController.isEthnicitySelected.value
                              ? "Select your ethnicity"
                              : personalDetailsController.ethnicityName.value,
                        ),
                      ),
                      HorizontalSpaceBox(10.w),
                      Icon(
                        CupertinoIcons.chevron_down,
                        size: 21.sp,
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
                              child: Text(
                                  personalDetailsController.ethnicities[index]),
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

          VerticalSpaceBox(10.h),

          // Fashion styles drop down menu section
          SizedBox(
            child: Row(
              children: [
                const Text(
                  "Fashion style : ",
                  style: TextStyle(color: INPUT_PLACEHOLDER),
                ),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: Row(
                    children: [
                      Obx(
                        () => Text(
                          !personalDetailsController
                                  .isFashionStyleSelected.value
                              ? "Select your favourite style"
                              : personalDetailsController
                                  .fashionStyleName.value,
                        ),
                      ),
                      HorizontalSpaceBox(10.w),
                      Icon(
                        CupertinoIcons.chevron_down,
                        size: 21.sp,
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
                          print(personalDetailsController.fashionStyleName);
                        },
                      ),
                    ),
                  ),
                ),
              ],
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
                personalDetailsController.storeWeight(value);
              },
              placeholder: "Enter your height : e.g. 180",
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
              textInputAction: TextInputAction.done,
              placeholderStyle: inputPlaceholderStyle,
            ),
          ),

          // Height error handler widget
          Obx(
            () => personalDetailsController.weightHasError.value
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
        ],
      ),
    );
  }
}
