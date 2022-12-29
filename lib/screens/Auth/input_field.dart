// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// Other packages
import 'package:sample/constants/constants.dart';
import 'package:sample/screens/Auth/LoginPage/input_field_controller.dart';

class InputField extends StatelessWidget {
  // Define states for input text attributes
  final String placeholderText;
  bool secureInput;
  // ignore: use_key_in_widget_constructors
  InputField(this.placeholderText, this.secureInput);
  // Using Input field controller
  final InputController = Get.put(InputFieldController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.h,
      // ignore: prefer_const_constructors
      child: Obx(
        () => CupertinoTextField(
          placeholder: placeholderText,
          obscureText: InputController.isPassword.value,
          suffix: secureInput
              ? CupertinoButton(
                  child: Icon(
                    InputController.isPassword.value
                        ? CupertinoIcons.eye
                        : CupertinoIcons.eye_slash,
                    color: SECONDARY_COLOR,
                  ),
                  onPressed: () {
                    // Toggles between show/hide password text
                    InputController.togglePassword();
                  },
                )
              : null,
          placeholderStyle: const TextStyle(color: INPUT_PLACEHOLDER),
        ),
      ),
    );
  }
}
