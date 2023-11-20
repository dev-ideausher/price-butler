import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pricebutler/app/services/responsive_size.dart';

import 'common_image_view.dart';

class PriceButtlerButton extends StatelessWidget {
  final Function() onpressed;
  final Color color;
  final String label;
  final String? svgPath;
  final String? imagePath;
  final TextStyle labelStyle;
  const PriceButtlerButton(
      {super.key,
      required this.onpressed,
      required this.label,
      required this.labelStyle,
      this.svgPath,
      this.imagePath,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: color,
            padding: EdgeInsets.symmetric(horizontal: 12.kw, vertical: 16.kh)),
        onPressed: onpressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
