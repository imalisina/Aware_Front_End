import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample/components/collections/outfitsSection/outfits_list.dart';

// Other packages
import 'package:sample/packages/title_content.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/packages/navbars/navbar_with_back_button.dart';
import 'package:sample/components/collections/add_new_collection_button.dart';

class OutfitsScreen extends StatelessWidget {
  const OutfitsScreen({super.key});

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
                  "Outfits", "List of uploaded outfits from your closet"),

              VerticalSpaceBox(20.h),

              // Add new outfit button
              const AddNewCollectionButton(
                buttonIcon: Icons.add_photo_alternate_rounded,
                buttonRoute: "",
              ),

              VerticalSpaceBox(20.h),

              // Clothes list
              const OutfitsList(),
            ],
          ),
        ),
      ),
    );
  }
}
