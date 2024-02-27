import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pricebutler/app/routes/app_pages.dart';
import 'package:pricebutler/app/services/colors.dart';
import 'package:pricebutler/app/services/responsive_size.dart';

import '../../../components/PriceButtleButton.dart';
import '../../../components/common_image_view.dart';
import '../../../constants/image_constant.dart';
import '../../../services/text_style_util.dart';
import '../controllers/sign_up_success_ful_controller.dart';

class SignUpSuccessFulView extends GetView<SignUpSuccessFulController> {
  const SignUpSuccessFulView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CommonImageView(
              svgPath: ImageConstant.svgloginsuccessful,
            ).paddingOnly(top: 290.kh, bottom: 40.kh),
            Text(
              'SignUp Successfully',
              style:
                  TextStyleUtil.inter700(fontSize: 24.kh, color: Colors.black),
            ).paddingOnly(bottom: 5.kh),
            Text(
              'You can browse the product on the home page now.',
              style:
                  TextStyleUtil.inter400(fontSize: 16.kh, color: Colors.black),
            ).paddingOnly(bottom: 20.kh),
            PriceButtlerButton(
                onpressed: () {
                  Get.toNamed(Routes.PRICEBUTTLERBOTTOMBAR);
                },
                label: 'Go To Home',
                labelStyle: TextStyleUtil.dmSans500(fontSize: 18.kh),
                color: context.Green)
          ],
        ).paddingOnly(left: 16.kw, right: 16.kw),
      ),
    ));
  }
}
