import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pricebutler/app/components/common_image_view.dart';
import 'package:pricebutler/app/components/priceButtlerLogo.dart';
import 'package:pricebutler/app/constants/image_constant.dart';
import 'package:pricebutler/app/services/responsive_size.dart';
import 'package:pricebutler/app/services/text_style_util.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      backgroundColor: const Color(0xff045A40),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CommonImageView(
                  imagePath: ImageConstant.pngsplashscreen,
                )
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(stops: const [
                0.0,
                0.3,
                0.9
              ], colors: [
                const Color(0xFF0C7857).withOpacity(0.9),
                Color.fromRGBO(12, 120, 87, 0.69),
                const Color(0xFF0C7857),
              ], begin: Alignment.center, end: Alignment.bottomCenter)),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                priceButtlerLogo(),
                Text(
                  'The ultimate guide to savings',
                  style: TextStyleUtil.KiteOne400(fontSize: 24.kh),
                ).paddingOnly(top: 21.kh),
              ],
            ).paddingOnly(bottom: 180.kh)
          ],
        ),
      ),
    );
  }
}
