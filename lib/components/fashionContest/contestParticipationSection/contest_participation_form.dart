import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sample/components/fashionContest/contestParticipationSection/contest_upload_face_picture_buttons.dart';
import 'package:sample/components/fashionContest/contestParticipationSection/uploaded_face_picture_preview.dart';
import 'package:sample/configs/theme.dart';
import 'package:sample/packages/space_box_container.dart';

class ContestParticipationForm extends StatelessWidget {
  const ContestParticipationForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: Column(
        children: [
          // Face image picker section
          const Text(
            "Pick or upload your face picture",
            style: TextStyle(color: INPUT_PLACEHOLDER),
          ),

          VerticalSpaceBox(20.h),

          // Image picker buttons
          const ContestUploadFacePictureButtons(),

          VerticalSpaceBox(20.h),

          // Uploaded face picture preview actions
          const UploadedFacePicturePreview(),

          const Divider(),

          VerticalSpaceBox(20.h),
        ],
      ),
    );
  }
}
