import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample/constants/constants.dart';
import 'package:sample/screens/CountrySelection/CountryList/country_list.dart';

// Other packages
import 'package:sample/utils/space_box_container.dart';

class CountrySelectionContent extends StatelessWidget {
  const CountrySelectionContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
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
            CupertinoButton(
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
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20).w,
                                child: const CupertinoSearchTextField(),
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
                  style: TextStyle(color: MAIN_COLOR),
                ))
          ],
        ),
      ),
    );
  }
}
