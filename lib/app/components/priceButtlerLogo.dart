import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pricebutler/app/services/colors.dart';
import 'package:pricebutler/app/services/responsive_size.dart';

import '../services/text_style_util.dart';

class priceButtlerLogo extends StatelessWidget {
  const priceButtlerLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: context.buttonUnfilledColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.kw)),
      child: Text(
        'PriceButlers',
        style: TextStyleUtil.robotoCondensed700(
            fontSize: 24.kh, color: Color(0xFF1C926D)),
      ).paddingSymmetric(horizontal: 12.kw, vertical: 24.kh),
    );
  }
}
