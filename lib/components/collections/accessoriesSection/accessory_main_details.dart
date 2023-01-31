import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Other packages
import 'package:sample/packages/space_box_container.dart';

class AccessoryMainDetails extends StatelessWidget {
  // Define states to store different values
  final String accessoryName, accessoryPicture;
  // Getting props from accessories_list.dart
  // ignore: use_key_in_widget_constructors
  const AccessoryMainDetails(
      {required this.accessoryName, required this.accessoryPicture});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          child: Image.network(
            accessoryPicture,
            width: 50.w,
            height: 50.w,
          ),
        ),
        HorizontalSpaceBox(6.w),
        SizedBox(
          width: 200.w,
          child: Text(
            accessoryName,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
