import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX packages
import 'package:get/get.dart';

// Other packages
import 'package:sample/configs/theme.dart';
import 'package:sample/controllers/location/location_controller.dart';
import 'package:sample/packages/navbars/navbar_with_back_button.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/packages/title_content.dart';
import 'package:sample/services/settings/locationSettings/location_settings_content.dart';

class LocationSettingsScreen extends StatelessWidget {
  const LocationSettingsScreen({super.key});

  static final locationController = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(
        navigationBar: navbarWithBackButton,
        child: SizedBox(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VerticalSpaceBox(50.h),

                // Title and sub-title
                const TitleContent("Location details",
                    "Check and edit your location details !"),

                VerticalSpaceBox(20.h),

                // Location settings content
                const LocationSettingsContent(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
