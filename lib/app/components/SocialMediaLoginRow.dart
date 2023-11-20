import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pricebutler/app/services/responsive_size.dart';

import '../constants/image_constant.dart';
import 'common_image_view.dart';

class SocialMedialLoginRow extends StatelessWidget {
  const SocialMedialLoginRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.kw)),
          child: CommonImageView(
            svgPath: ImageConstant.svgFacebook,
          ).paddingAll(10.kh),
        ),
        Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.kw)),
          child: CommonImageView(
            svgPath: ImageConstant.svgGoogle,
          ).paddingAll(10.kh),
        ).paddingOnly(left: 15.kw, right: 15.kw),
        Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.kw)),
          child: CommonImageView(
            height: 45.kh,
            width: 45.kw,
            svgPath: ImageConstant.svgApple,
          ).paddingAll(17.kh),
        )
      ],
    );
  }
}
