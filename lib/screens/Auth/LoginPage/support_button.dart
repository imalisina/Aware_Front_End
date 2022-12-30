import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Other packages
import 'package:sample/constants/constants.dart';

class SupportButton extends StatelessWidget {
  const SupportButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: CupertinoButton(
          child: Icon(
            CupertinoIcons.headphones,
            color: MAIN_COLOR ,
            size: 27.w,
          ),
          onPressed: () {}),
    );
  }
}
