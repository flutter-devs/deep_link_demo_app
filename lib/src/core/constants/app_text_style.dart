import 'package:flutter/material.dart';

import 'constant_imports.dart';

class AppTextStyles {
  static TextStyle regularText({
    double? height,
    Color color = ColorConstants.black,
    bool isUnderline = false,
    double fontSize = Dimensions.px14,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w300,
      color: color,
      height: height,
      decoration: isUnderline ? TextDecoration.underline : TextDecoration.none,
    );
  }

  static TextStyle semiBoldText({
    double? height,
    Color color = ColorConstants.black,
    bool isUnderline = false,
    required double fontSize,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      color: color,
      height: height,
      decoration: isUnderline ? TextDecoration.underline : TextDecoration.none,
    );
  }

  static TextStyle boldText({
    double? height,
    Color color = ColorConstants.black,
    bool isUnderline = false,
    double fontSize = Dimensions.px14,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: color,
      height: height,
      decoration: isUnderline ? TextDecoration.underline : TextDecoration.none,
    );
  }
}
