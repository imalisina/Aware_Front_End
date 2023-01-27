import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Define application color theme
// ignore: constant_identifier_names
const MAIN_COLOR = Color.fromARGB(225, 211, 8, 62);
// ignore: constant_identifier_names
const BACKGROUND_COLOR = Color.fromARGB(255, 255, 255, 255);
// ignore: constant_identifier_names
const PRIMARY_COLOR = Color.fromARGB(255, 27, 32, 33);
// ignore: constant_identifier_names
const SECONDARY_COLOR = Color.fromARGB(255, 146, 147, 157);
// ignore: constant_identifier_names
const INPUT_PLACEHOLDER = Color.fromARGB(255, 188, 189, 199);
// ignore: constant_identifier_names
const GHOST_COLOR = Color.fromARGB(255, 226, 226, 235);
// ignore: constant_identifier_names
const ERROR_COLOR = Color.fromARGB(255, 196, 28, 2);
// ignore: constant_identifier_names
const AGREE_COLOR = Color.fromARGB(255, 50, 152, 2);
// ignore: constant_identifier_names
const DISAGREE_COLOR = Color.fromARGB(255, 196, 28, 2);

// Define application navigation bar title details
const disableBackButton = false;
const enableBackButton = true;
const navigationBorder = Border(bottom: BorderSide(color: BACKGROUND_COLOR));
const titleText = "Aware";
double titleFontSize = 25.0.sp;
const titleFontWeight = FontWeight.w500;
const inputPlaceholderStyle =
    TextStyle(color: INPUT_PLACEHOLDER, fontWeight: FontWeight.w300);
const inputActiveDataPlaceholderStye =
    TextStyle(color: SECONDARY_COLOR, fontWeight: FontWeight.w500);
const dropDownStyleDefault = TextStyle(color: PRIMARY_COLOR);
const dropDownStyleError = TextStyle(color: ERROR_COLOR);
TextStyle sectionTitle = TextStyle(
    color: INPUT_PLACEHOLDER, fontSize: 22.sp, fontWeight: FontWeight.w500);
