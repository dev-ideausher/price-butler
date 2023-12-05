import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pricebutler/app/services/responsive_size.dart';

import '../constants/image_constant.dart';
import 'common_image_view.dart';

class PriceButtlerButton extends StatelessWidget {
  final Function() onpressed;
  final Color color;
  final String label;
  final bool? profilebutton;
  final String? svgPath;
  final String? imagePath;
  final TextStyle labelStyle;
  final EdgeInsets? edgeInsets;
  final OutlinedBorder? shape;
  const PriceButtlerButton(
      {super.key,
      required this.onpressed,
      required this.label,
      required this.labelStyle,
      this.svgPath,
      this.imagePath,
      required this.color,
      this.edgeInsets,
      this.shape,
      this.profilebutton});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            shape: shape,
            backgroundColor: color,
            padding: edgeInsets ??
                EdgeInsets.symmetric(horizontal: 12.kw, vertical: 16.kh)),
        onPressed: onpressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (profilebutton == true) // Check if profilebutton is true
              CommonImageView(
                svgPath: ImageConstant.svgsupercoins,
              ),
            CommonImageView(
              svgPath: svgPath,
              imagePath: imagePath,
            ).paddingOnly(right: 10.kw),
            Text(
              label,
              style: labelStyle,
            ),
          ],
        ));
  }
}
