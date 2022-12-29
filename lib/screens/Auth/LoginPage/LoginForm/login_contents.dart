import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Other components
import 'package:sample/screens/Auth/input_field.dart';
import 'package:sample/utils/space_box_container.dart';

class LoginContents extends StatelessWidget {
  const LoginContents({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30).w,
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            InputField("Enter your email", false),
            VerticalSpaceBox(20.h),
            InputField("Enter your password", true),
          ],
        ),
      ),
    );
  }
}
