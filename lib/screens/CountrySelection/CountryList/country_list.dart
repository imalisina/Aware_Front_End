import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX package
import 'package:get/get.dart';
import 'package:sample/screens/CountrySelection/select_country_controller.dart';

// Other packages
import 'package:sample/constants/countries.dart';
import 'package:sample/constants/constants.dart';
import 'package:sample/utils/space_box_container.dart';

class CountryList extends StatelessWidget {
  const CountryList({super.key});

  // Get countries state from GetX
  static final countryController = Get.put(SelectCountryController());

  @override
  Widget build(BuildContext context) {
    // Display avaialble countries from JSON file
    return ListView.builder(
      itemCount: Countries().countries.length,
      itemBuilder: (context, index) {
        var country = Countries().countries[index];
        return CupertinoButton(
          padding:
              EdgeInsets.only(left: 15.w, right: 15.w, bottom: 6.h, top: 3.h),
          onPressed: () {
            // Getting the selected countries ID and store it in the controller
            countryController.setSelectCountry(index);
            Navigator.of(context).pop();
            Get.toNamed("/auth/login");
          },
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Left side - country flag and name of each country
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16).w,
                        child: Image.asset(
                          "assets/images/countries/${country.flag}",
                          width: 40.w,
                          height: 30.h,
                        ),
                      ),
                      HorizontalSpaceBox(10.w),
                      Text(
                        country.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, color: PRIMARY_COLOR),
                      ),
                    ],
                  ),
                  // Right side - country code of each country
                  Text(
                    "+ ${country.code}",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: SECONDARY_COLOR,
                    ),
                  ),
                ],
              ),
              const Divider(),
              VerticalSpaceBox(6.h),
            ],
          ),
        );
      },
    );
  }
}
