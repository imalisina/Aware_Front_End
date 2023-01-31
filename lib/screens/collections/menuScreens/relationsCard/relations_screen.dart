import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample/components/collections/add_new_collection_button.dart';

// Other packages
import 'package:sample/packages/title_content.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/components/collections/relationSection/relations_list.dart';
import 'package:sample/packages/navbars/navbar_with_back_button.dart';

class RelationsScreen extends StatelessWidget {
  const RelationsScreen({super.key});

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
                  "Relations", "List of your relations and friends"),

              VerticalSpaceBox(10.h),

              // Add new relation button
              const AddNewCollectionButton(
                  buttonIcon: Icons.person_add_alt_rounded, buttonRoute: ""),

              VerticalSpaceBox(20.h),

              // Relations list
              const RelationsList(),
            ],
          ),
        ),
      ),
    );
  }
}
