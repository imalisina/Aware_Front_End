import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Other packages
import 'package:sample/configs/theme.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/components/countrySelection/countryList/country_list.dart';

class CountrySelectionContent extends StatelessWidget {
  const CountrySelectionContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/country_selection.gif",
              height: 400.h,
              width: 400.w,
            ),
            VerticalSpaceBox(30.h),
            Text(
              "Select your country",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: PRIMARY_COLOR,
                  fontSize: 32.sp),
            ),
            VerticalSpaceBox(20.h),

            // Select country button section
            CupertinoButton.filled(
                onPressed: () => showCupertinoModalPopup(
                    context: context,
                    builder: (BuildContext context) {
                      return CupertinoPopupSurface(
                        child: Container(
                          color: BACKGROUND_COLOR,
                          alignment: Alignment.center,
                          width: double.maxFinite,
                          height: 600.h,
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
                              const Expanded(
                                child: CountryList(),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                child: const Text(
                  "Select your region",
                ))
          ],
        ),
      ),
    );
  }
}
