import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX package
import 'package:get/get.dart';

// Other packages
import 'package:sample/constants/constants.dart';
import 'package:sample/screens/SupportPage/ContactUsPage/contact_us_controller.dart';
import 'package:sample/utils/space_box_container.dart';

class ContactUsForm extends StatelessWidget {
  const ContactUsForm({super.key});

  // Define contact us form controller
  static final contactController = Get.put(ContactUsController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25.w, right: 25.w),
      child: Column(
        children: [
          // Subject dropwdown field
          SizedBox(
            child: Row(
              children: [
                const Text(
                  "Subject : ",
                  style: TextStyle(color: INPUT_PLACEHOLDER),
                ),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: Row(
                    children: [
                      Obx(
                        () => Text(
                          contactController.subjectName.isEmpty
                              ? "Select the subject"
                              : contactController.subjectName.value,
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
                          contactController.subjects.length,
                          (int index) {
                            return Center(
                              child: Text(contactController.subjects[index]),
                            );
                          },
                        ),
                        onSelectedItemChanged: (int value) {
                          contactController.storeSelectedSubjectID(value);
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          VerticalSpaceBox(10.h),

          // Textarea section - Description section
          SizedBox(
            height: 250.h,
            child: CupertinoTextField(
              keyboardType: TextInputType.text,
              prefix: Obx(() => contactController.descriptionHasError.value
                  ? Container(
                      margin: EdgeInsets.only(left: 10.w),
                      child: const Icon(
                        CupertinoIcons.clear_thick_circled,
                        color: ERROR_COLOR,
                      ),
                    )
                  : const EmptyBox()),
              onSubmitted: (value) {
                contactController.storeDescription(value);
              },
              placeholder: "Write your description . . .",
              textInputAction: TextInputAction.done,
              placeholderStyle: inputPlaceholderStyle,
              maxLength: 400,
              maxLines: 20,
            ),
          ),

          // Description error handler widget
          Obx(() => contactController.descriptionHasError.value
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 6.h),
                      child: Text(
                        "Description is empty !",
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

          // Submit button
          SizedBox(
            width: double.maxFinite,
            child: Obx(
              () => CupertinoButton.filled(
                child: contactController.spinnerStatus.value
                    ? const CupertinoActivityIndicator(
                        color: BACKGROUND_COLOR,
                      )
                    : const Text("Submit"),
                onPressed: () {
                  // Perform validation process
                  contactController.descriptionValidation();
                  // Open redirection gateway
                  contactController.setAuthorized();

                  // Redirect to home screen
                  if (contactController.hasPermission.isTrue) {
                    // Toggle method to display spinner during API calls
                    contactController.toggleLoading();
                    Timer(
                      const Duration(seconds: 3),
                      () {
                        contactController.toggleLoading();

                        // Redirection route
                        Get.back();
                      },
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
