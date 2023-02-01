import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX packages
import 'package:get/get.dart';
import 'package:sample/controllers/collections/places/places_controller.dart';

// Other packages
import 'package:sample/configs/theme.dart';
import 'package:sample/packages/flush_bar_method.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/components/collections/placesSection/place_update_form.dart';

class EditPlaceModal extends StatelessWidget {
  // Define variables to store state values
  final String placeName;
  // Getting state values from places_list.dart
  // ignore: use_key_in_widget_constructors
  const EditPlaceModal({required this.placeName});

  // Define places controller
  static final placesController = Get.put(PlacesController());

  @override
  Widget build(BuildContext context) {
    return CupertinoPopupSurface(
      child: Container(
        color: BACKGROUND_COLOR,
        width: double.maxFinite,
        height: 500.h,
        child: SingleChildScrollView(
          child: Column(
            children: [
              CupertinoButton(
                child: const Text(
                  "Close",
                  style: TextStyle(color: SECONDARY_COLOR),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),

              // Place update form section
              PlaceUpdateForm(
                placeName: placeName,
              ),

              VerticalSpaceBox(20.h),

              // Validate updated place details
              SizedBox(
                width: 100.w,
                child: Obx(
                  () => CupertinoButton.filled(
                    padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                    child: placesController.spinnerStatus.value
                        ? const CupertinoActivityIndicator(
                            color: BACKGROUND_COLOR,
                          )
                        : Icon(
                            Icons.check_rounded,
                            size: 30.sp,
                          ),
                    onPressed: () {
                      // Perform validation process
                      placesController.validateName();
                      // Open redirection gateway
                      placesController.updatePlaceDetails();

                      // Redirect to previous screen
                      if (placesController.isUpdatable.isTrue) {
                        // Togge method to display spinner during API calls
                        placesController.toggleLoading();
                        Timer(
                          const Duration(milliseconds: 1000),
                          () {
                            Get.back();
                            showSnackBar(context,
                                "Place details has been edited successfully !");
                            placesController.toggleLoading();
                          },
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
