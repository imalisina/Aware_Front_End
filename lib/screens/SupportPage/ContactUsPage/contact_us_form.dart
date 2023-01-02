import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample/constants/constants.dart';
import 'package:sample/utils/space_box_container.dart';

class ContactUsForm extends StatelessWidget {
  const ContactUsForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 18.w, right: 18.w),
      child: Column(
        children: [
          // Subject dropwdown field
          SizedBox(
            child: CupertinoButton(
              child: Row(
                children: [
                  const Text(
                    "Select the subject",
                    style: TextStyle(color: MAIN_COLOR),
                  ),
                  HorizontalSpaceBox(10.w),
                  Icon(
                    CupertinoIcons.chevron_down,
                    color: MAIN_COLOR,
                    size: 21.sp,
                  ),
                ],
              ),
              onPressed: () => showCupertinoModalPopup(
                context: context,
                builder: (_) => SizedBox(
                  width: double.maxFinite,
                  height: 250.h,
                  child: CupertinoPicker(
                    backgroundColor: BACKGROUND_COLOR,
                    itemExtent: 30,
                    children: const [
                      // Text("Subject 1"),
                      // Text("Subject 2"),
                      // Text("Subject 3"),
                      // Text("Subject 4"),
                      // Text("Subject 5"),
                    ],
                    onSelectedItemChanged: (int value) {},
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
