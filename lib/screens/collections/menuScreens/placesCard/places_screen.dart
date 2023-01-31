import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Other packages
import 'package:sample/packages/title_content.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/packages/navbars/navbar_with_back_button.dart';
import 'package:sample/components/collections/placesSection/places_list.dart';
import 'package:sample/components/collections/add_new_collection_button.dart';

class PlacesScreen extends StatelessWidget {
  const PlacesScreen({super.key});

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
                  "Places", "List of your pinned and favourite places !"),

              VerticalSpaceBox(20.h),

              // Add new place button
              const AddNewCollectionButton(
                buttonIcon: Icons.add_location_alt_rounded,
                buttonRoute: "",
              ),

              VerticalSpaceBox(20.h),

              // Places list
              const PlacesList(),
            ],
          ),
        ),
      ),
    );
  }
}
