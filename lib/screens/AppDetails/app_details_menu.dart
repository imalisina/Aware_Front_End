import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample/packages/horizontal_card_button.dart';

class AppDetailsMenu extends StatelessWidget {
  const AppDetailsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: Column(
        children: const [
          SizedBox(
            child: CardContent("Terms of use",
                CupertinoIcons.exclamationmark_circle, "/details/terms"),
          ),
          Divider(),
          SizedBox(
            child: CardContent(
                "Privacy policy", CupertinoIcons.person, "/details/privacy"),
          ),
          Divider(),
          SizedBox(
            child: CardContent("User agreement", CupertinoIcons.doc_text,
                "/details/agreement"),
          )
        ],
      ),
    );
  }
}
