import 'package:flutter/material.dart';

class TextStyleUtil {
  static TextStyle KiteOne400({
    Color color = Colors.white,
    required double fontSize,
  }) {
    return TextStyle(
      fontFamily: 'KiteOne',
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle genSans400({
    Color color = Colors.white,
    required double fontSize,
  }) {
    return TextStyle(
      fontFamily: 'General Sans',
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle inter700(
      {Color color = Colors.white,
      required double fontSize,
      TextDecoration? decoration}) {
    return TextStyle(
      fontFamily: 'Inter',
      color: color,
      fontSize: fontSize,
      decoration: decoration,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle inter600(
      {Color color = Colors.white,
      required double fontSize,
      TextDecoration? decoration}) {
    return TextStyle(
      fontFamily: 'Inter',
      color: color,
      fontSize: fontSize,
      decoration: decoration,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle inter400(
      {Color color = Colors.white,
      required double fontSize,
      TextDecoration? decoration}) {
    return TextStyle(
      fontFamily: 'Inter',
      color: color,
      decoration: decoration,
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle interStrike400({
    Color color = Colors.white,
    required double fontSize,
  }) {
    return TextStyle(
      fontFamily: 'Inter',
      decoration: TextDecoration.lineThrough,
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle inter500({
    Color color = Colors.white,
    required double fontSize,
  }) {
    return TextStyle(
      fontFamily: 'Inter',
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle robotoCondensed700({
    Color color = Colors.white,
    required double fontSize,
  }) {
    return TextStyle(
      fontFamily: 'Roboto_Condensed',
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle dmSans500({
    Color color = Colors.white,
    required double fontSize,
  }) {
    return TextStyle(
      fontFamily: 'Dm Sans',
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle nunito500({
    Color color = Colors.black,
    required double fontSize,
  }) {
    return TextStyle(
      fontFamily: 'Nunito',
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle nunito800({
    Color color = Colors.black,
    required double fontSize,
  }) {
    return TextStyle(
      fontFamily: 'Nunito Bold',
      color: color,
      fontSize: fontSize,
      fontWeight: FontWeight.w800,
    );
  }
}

extension AppText on String {
  String get string => this;

  Widget text300(double fontSize,
          {Color color = Colors.black, TextAlign? textAlign}) =>
      Text(
        string,
        textAlign: textAlign,
        style: TextStyle(
          fontFamily: 'General Sans',
          color: color,
          fontSize: fontSize,
          fontWeight: FontWeight.w300,
        ),
      );

  Widget text400(double fontSize,
          {Color color = Colors.black, TextAlign? textAlign}) =>
      Text(
        string,
        textAlign: textAlign,
        style: TextStyle(
          fontFamily: 'General Sans',
          color: color,
          fontSize: fontSize,
          fontWeight: FontWeight.w400,
        ),
      );

  Widget text500(double fontSize,
          {Color color = Colors.black, TextAlign? textAlign}) =>
      Text(
        string,
        textAlign: textAlign,
        style: TextStyle(
          fontFamily: 'General Sans',
          color: color,
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
        ),
      );

  Widget text600(double fontSize,
          {Color color = Colors.black,
          TextAlign? textAlign,
          TextStyle? style}) =>
      Text(
        string,
        textAlign: textAlign,
        style: style ??
            TextStyle(
              fontFamily: 'General Sans',
              color: color,
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
            ),
      );
}
