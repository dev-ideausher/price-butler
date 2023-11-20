import 'package:flutter/material.dart';
import 'package:pricebutler/app/services/responsive_size.dart';

class PriceButlerTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool? obscureText;
  final Widget? suffixIcon;
  final Color? focusColor;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final TextStyle? textStyle;
  final Widget? prefixIcon;
  final TextInputType? textInputType;
  final bool? readonly;
  final VoidCallback? onTap;
  final FocusNode? focusNode;
  final BoxConstraints? preficIconConstraints;
  const PriceButlerTextField(
      {super.key,
      this.controller,
      this.hintText,
      this.obscureText,
      this.textStyle,
      this.prefixIcon,
      this.textInputType,
      this.readonly,
      this.onTap,
      this.focusNode,
      this.validator,
      this.preficIconConstraints,
      this.onChanged,
      this.focusColor,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: TextFormField(
        onTap: onTap,
        style: TextStyle(color: Colors.black),
        validator: validator,
        controller: controller,
        obscureText: obscureText ?? false,
        focusNode: focusNode,
        readOnly: readonly ?? false,
        keyboardType: textInputType,
        onChanged: onChanged,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: textStyle,
          focusColor: focusColor,
          filled: true,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          prefixIconConstraints: preficIconConstraints,
          contentPadding: EdgeInsets.all(13.kw),
          fillColor: const Color(0xFFF2F2F2),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.transparent)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.transparent)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.red)),
        ),
      ),
    );
  }
}
