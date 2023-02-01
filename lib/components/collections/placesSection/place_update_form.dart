import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX packages
import 'package:get/get.dart';
import 'package:sample/controllers/collections/places/places_controller.dart';

// Other packages
import 'package:sample/configs/theme.dart';
import 'package:sample/packages/space_box_container.dart';

class PlaceUpdateForm extends StatelessWidget {
  // Define variables to store state values
  final String placeName;
  // Getting details from edit_place_modal.dart
  // ignore: use_key_in_widget_constructors
  const PlaceUpdateForm({required this.placeName});

  // Define places controller
  static final placesController = Get.put(PlacesController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30.w, right: 30.w),
      child: Obx(
        () => Column(
          children: [
            // Place name input field
            SizedBox(
              height: 55.h,
              child: CupertinoTextField(
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  placesController.storePlaceName(value);
                },
                placeholder: "Name : $placeName",
                prefix: placesController.placeNameHasError.value
                    ? Container(
                        margin: EdgeInsets.only(left: 10.w),
                        child: const Icon(
                          Icons.cancel_rounded,
                          color: ERROR_COLOR,
                        ),
                      )
                    : const EmptyBox(),
                textInputAction: TextInputAction.done,
                placeholderStyle: inputPlaceholderStyle,
              ),
            ),

            // Place name error handler widget
            placesController.placeNameHasError.value
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 6.h),
                        child: Text(
                          "Enter a valid place name !",
                          style: TextStyle(
                              color: ERROR_COLOR,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  )
                : const EmptyBox(),
          ],
        ),
      ),
    );
  }
}
