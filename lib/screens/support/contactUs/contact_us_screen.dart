import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// GetX package
import 'package:sample/packages/navbars/navbar_with_back_button.dart';

// Other packages
import 'package:sample/services/support/contactUs/contact_us_form.dart';
import 'package:sample/packages/space_box_container.dart';
import 'package:sample/packages/title_content.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

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
                const TitleContent(
                    "Contact Us", "Describe your problem to our team"),

                VerticalSpaceBox(30.h),

                // Contact us input fields and button
                const ContactUsForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
