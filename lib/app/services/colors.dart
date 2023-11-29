import 'package:flutter/material.dart';

import 'hexColorToFlutterColor.dart';

extension ColorUtil on BuildContext {
  Color dynamicColor({required int light, required int dark}) {
    return (Theme.of(this).brightness == Brightness.light)
        ? Color(light)
        : Color(dark);
  }

  Color dynamicColour({required Color light, required Color dark}) {
    return (Theme.of(this).brightness == Brightness.light) ? light : dark;
  }

  Color get brandColor1 =>
      dynamicColour(light: HexColor("#1C926D"), dark: HexColor("#000000"));

  Color get brandColor2 =>
      dynamicColour(light: HexColor("#1C926D"), dark: HexColor("#000000"));

  Color get buttonFillColor =>
      dynamicColour(light: HexColor("#1C926D"), dark: HexColor("#000000"));

  Color get buttonUnfilledColor =>
      dynamicColour(light: HexColor("#EEFFFA"), dark: HexColor("#000000"));
  Color get progressBarColor =>
      dynamicColour(light: HexColor("#DEDEDE"), dark: HexColor("#000000"));
  Color get primaryLightGreen03 =>
      dynamicColour(light: HexColor("#DDF7EB"), dark: HexColor("#000000"));
  Color get primaryLightGreen04 =>
      dynamicColour(light: HexColor("#EEFFFA"), dark: HexColor("#000000"));
  Color get primaryLightGreen05 =>
      dynamicColour(light: HexColor("#D3F2D0"), dark: HexColor("#000000"));
  Color get Green =>
      dynamicColour(light: HexColor("#1C926D"), dark: HexColor("#000000"));
  Color get GreyNeutral =>
      dynamicColour(light: HexColor("#787878"), dark: HexColor("#000000"));
  Color get BlackNeutral =>
      dynamicColour(light: HexColor("#1F1F21"), dark: HexColor("#000000"));
  Color get TeritaryGreen =>
      dynamicColour(light: HexColor("#06A487"), dark: HexColor("#000000"));
  Color get fiveStarColor =>
      dynamicColour(light: HexColor("#06A487"), dark: HexColor("#000000"));
  Color get fourStarColor =>
      dynamicColour(light: HexColor("#1FBDA1"), dark: HexColor("#000000"));
  Color get threeStarColor =>
      dynamicColour(light: HexColor("#7FD8C8"), dark: HexColor("#000000"));
  Color get twoStarColor =>
      dynamicColour(light: HexColor("#1FBDA1"), dark: HexColor("#000000"));
  Color get oneStarColor =>
      dynamicColour(light: HexColor("#FB9232"), dark: HexColor("#000000"));
  Color get cyanLight =>
      dynamicColour(light: HexColor("#FFF4EA"), dark: HexColor("#000000"));
}
