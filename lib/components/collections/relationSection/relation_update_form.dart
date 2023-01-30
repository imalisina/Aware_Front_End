import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX packages
import 'package:get/get.dart';
import 'package:sample/controllers/collections/relations/relations_controller.dart';

// Other packages
import 'package:sample/configs/theme.dart';
import 'package:sample/packages/space_box_container.dart';

class RelationUpdateForm extends StatelessWidget {
  // Define variables to store prop values
  final String name, age;
  // Getting details from relations_list.dart
  // ignore: use_key_in_widget_constructors
  const RelationUpdateForm({required this.name, required this.age});

  // Define relations controller
  static final relationsController = Get.put(RelationsController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30.w, right: 30.w),
      child: Obx(
        () => Column(
          children: [
            // Gender dropdown menu section
            SizedBox(
              child: Row(
                children: [
                  relationsController.genderHasError.value
                      ? const Icon(
                          CupertinoIcons.clear_circled_solid,
                          color: ERROR_COLOR,
                        )
                      : const EmptyBox(),
                  HorizontalSpaceBox(
                      relationsController.genderHasError.value ? 4.w : 0.w),
                  const Text(
                    "Gender : ",
                    style: TextStyle(color: INPUT_PLACEHOLDER),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Row(
                      children: [
                        Text(
                          style: relationsController.genderHasError.value
                              ? dropDownStyleError
                              : dropDownStyleDefault,
                          !relationsController.isGenderSelected.value
                              ? "Select a new gender"
                              : relationsController.genderName.value,
                        ),
                        HorizontalSpaceBox(7.w),
                        Icon(
                          CupertinoIcons.chevron_down,
                          size: 21.sp,
                          color: relationsController.genderHasError.value
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
                            relationsController.genderOptions.length,
                            (int index) {
                              return Center(
                                child: Text(
                                  relationsController.genderOptions[index],
                                ),
                              );
                            },
                          ),
                          onSelectedItemChanged: (int value) {
                            relationsController.storeGenderId(value);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            VerticalSpaceBox(20.h),

            // Relation dropdown menu section
            SizedBox(
              child: Row(
                children: [
                  relationsController.relationHasError.value
                      ? const Icon(
                          CupertinoIcons.clear_circled_solid,
                          color: ERROR_COLOR,
                        )
                      : const EmptyBox(),
                  HorizontalSpaceBox(
                      relationsController.relationHasError.value ? 4.w : 0.w),
                  const Text(
                    "Relation : ",
                    style: TextStyle(color: INPUT_PLACEHOLDER),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Row(
                      children: [
                        Text(
                          style: relationsController.relationHasError.value
                              ? dropDownStyleError
                              : dropDownStyleDefault,
                          !relationsController.isRelationSelected.value
                              ? "Select a new relation"
                              : relationsController.relationName.value,
                        ),
                        HorizontalSpaceBox(7.w),
                        Icon(
                          CupertinoIcons.chevron_down,
                          size: 21.sp,
                          color: relationsController.relationHasError.value
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
                            relationsController.relationOptions.length,
                            (int index) {
                              return Center(
                                child: Text(
                                  relationsController.relationOptions[index],
                                ),
                              );
                            },
                          ),
                          onSelectedItemChanged: (int value) {
                            relationsController.storeRelationId(value);
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
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  relationsController.storeName(value);
                },
                placeholder: "Name : $name",
                prefix: relationsController.nameHasError.value
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

            relationsController.nameHasError.value
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

            // Age input field
            SizedBox(
              height: 55.h,
              child: CupertinoTextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  relationsController.storeAge(value);
                },
                placeholder: "$age years old",
                prefix: relationsController.ageHasError.value
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
            relationsController.ageHasError.value
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 6.h),
                        child: Text(
                          "Enter a valid age !",
                          style: TextStyle(
                              color: ERROR_COLOR,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  )
                : const EmptyBox(),
          ],
        ),
      ),
    );
  }
}
