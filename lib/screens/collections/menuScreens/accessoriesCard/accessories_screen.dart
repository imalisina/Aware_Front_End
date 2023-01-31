import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Other packages
import 'package:sample/packages/title_content.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/packages/navbars/navbar_with_back_button.dart';
import 'package:sample/components/collections/add_new_collection_button.dart';
import 'package:sample/components/collections/accessoriesSection/accessories_list.dart';

class AccessoriesScreen extends StatelessWidget {
  const AccessoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(
        navigationBar: navbarWithBackButton,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VerticalSpaceBox(50.h),

              // Title and sub-title
              const TitleContent(
                  "Accessories", "List of uploaded accessories !"),

              VerticalSpaceBox(20.h),

              // Add new accessory button
              const AddNewCollectionButton(
                buttonIcon: Icons.add_photo_alternate_rounded,
                buttonRoute: "",
              ),

              VerticalSpaceBox(20.h),

              // Accessories list
              const AccessoriesList(),
            ],
          ),
        ),
      ),
    );
  }
}
