import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Other packages
import 'package:sample/packages/space_box_container.dart';

class OutfitMainDetails extends StatelessWidget {
  // Define states to store different values
  final String outfitName, outfitPicture;
  // Getting props from outfits_list.dart
  // ignore: use_key_in_widget_constructors
  const OutfitMainDetails(
      {required this.outfitName, required this.outfitPicture});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          child: Image.network(
            outfitPicture,
            width: 50.w,
            height: 50.w,
          ),
        ),
        HorizontalSpaceBox(6.w),
        SizedBox(
          width: 200.w,
          child: Text(
            outfitName,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
