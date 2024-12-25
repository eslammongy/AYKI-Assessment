import 'package:ayki_assessment/core/utils/size_config.dart';
import 'package:flutter/material.dart';

abstract class TextStyleManager {
  static TextStyle _style(
    double fontSize,
    FontWeight fontWeight,
  ) {
    return TextStyle(
        fontSize: SizeConfig().scaleText(fontSize),
        fontWeight: fontWeight,
        fontFamily: "Inter");
  }

  static const FontWeight light = FontWeight.w300;
  static const FontWeight _regular = FontWeight.w400;
  static const FontWeight _semiBold = FontWeight.w600;
  static const FontWeight _bold = FontWeight.w700;

  static TextStyle get headline1 => _style(
        40,
        _bold,
      );
  static TextStyle get headline2 => _style(
        32,
        _bold,
      );
  static TextStyle get headline3 => _style(
        24,
        _semiBold,
      );
  static TextStyle get largeBody => _style(
        18,
        _regular,
      );
  static TextStyle get smallBody => _style(
        14,
        _regular,
      );

  static TextStyle get buttons => _style(
        16,
        _semiBold,
      );

  static TextStyle get labels => _style(
        12,
        _regular,
      );
}
