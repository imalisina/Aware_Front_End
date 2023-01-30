import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Other packages
import 'package:sample/packages/title_content.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/components/collections/collections_menu.dart';

class CollectionsScreen extends StatelessWidget {
  const CollectionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(
        child: SizedBox(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VerticalSpaceBox(50.h),
          
                // Title and sub-title
                const TitleContent("My collections",
                    "Check and update everything in your collections"),
          
                VerticalSpaceBox(50.h),
          
                // Collection menu
                const CollectionsMenu(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
