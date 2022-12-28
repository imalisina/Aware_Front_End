import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Other packages
import 'package:sample/constants/constants.dart';
import 'package:sample/constants/countries.dart';
import 'package:sample/utils/space_box_container.dart';

class CountrySelectionContent extends StatefulWidget {
  CountrySelectionContent({super.key});

  @override
  State<CountrySelectionContent> createState() =>
      _CountrySelectionContentState();
}

class _CountrySelectionContentState extends State<CountrySelectionContent> {
  // final countrySelector = Get.put(CountrySelectionController());
  List<Country> countries = allCountries;

  @override
  Widget build(BuildContext context) {
    return Center(
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
                              child: const Text("Close"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20).w,
                              child: CupertinoSearchTextField(),
                            ),
                            Expanded(
                                child: ListView.builder(
                              itemCount: countries.length,
                              itemBuilder: (context, index) {
                                final country = countries[index];
                                return Container(
                                  child: SingleChildScrollView(
                                    child: ,
                                  ),
                                );
                              },
                            ))
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
    );
  }
}
