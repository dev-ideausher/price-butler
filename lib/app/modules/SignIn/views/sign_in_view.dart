import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pricebutler/app/components/PriceButlerTextField.dart';
import 'package:pricebutler/app/components/PriceButtleButton.dart';
import 'package:pricebutler/app/components/SocialMediaLoginRow.dart';
import 'package:pricebutler/app/routes/app_pages.dart';
import 'package:pricebutler/app/services/colors.dart';
import 'package:pricebutler/app/services/responsive_size.dart';

import '../../../services/text_style_util.dart';
import '../controllers/sign_in_controller.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SignInController());

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  elevation: 10,
                  color: Color(0xFFEEFFFA),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.kw),
                  ),
                  child: Text(
                    'PriceButlers',
                    style: TextStyleUtil.robotoCondensed700(
                      fontSize: 24.kh,
                      color: context.Green,
                    ),
                  ).paddingSymmetric(horizontal: 26.kw, vertical: 12.kh),
                ),
                Text(
                  'Welcome Back!',
                  style: TextStyleUtil.inter700(
                    fontSize: 24.kh,
                    color: Colors.black,
                  ),
                ).paddingOnly(top: 34.kh, bottom: 34.kh),
                PriceButlerTextField(
                  prefixIcon: Icon(
                    CupertinoIcons.phone,
                    color: context.GreyNeutral,
                  ),
                  focusColor: context.GreyNeutral,
                  textInputType: TextInputType.numberWithOptions(),
                  hintText: 'Phone',
                  onChanged: (value) => controller.phoneNumber.value = value,
                  textStyle: TextStyleUtil.inter400(
                    fontSize: 16.kh,
                    color: context.GreyNeutral,
                  ),
                ).paddingOnly(bottom: 24.kh),
                Obx(
                  () => PriceButtlerButton(
                    onpressed: () {
                      controller.phoneNumber.isNotEmpty
                          ? controller.handleButtonPress()
                          : null;
                    },
                    color: controller.phoneNumber.isNotEmpty
                        ? context.Green
                        : context.buttonUnfilledColor,
                    label: 'Continue',
                    labelStyle: TextStyleUtil.inter400(
                      fontSize: 18.kh,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      color: Colors.black,
                      height: 1.kh,
                      width: 34.kw,
                    ).paddingOnly(left: 50.kw),
                    Text(
                      'OR Continue With',
                      style: TextStyleUtil.inter400(
                        fontSize: 14.kh,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      color: Colors.black,
                      height: 1.kh,
                      width: 34.kw,
                    ).paddingOnly(right: 50.kw),
                  ],
                ).paddingOnly(top: 24.kh, bottom: 24.kh),
                SocialMedialLoginRow(),
                RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyleUtil.inter400(
                      fontSize: 16.kh,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: 'Create Account',
                        style: TextStyleUtil.inter700(
                          fontSize: 16.kh,
                          color: context.brandColor1,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.toNamed(Routes.SIGN_UP);
                          },
                      ),
                    ],
                  ),
                ).paddingOnly(top: 10.kh, bottom: 31.kh),
                TextButton(
                  onPressed: () {
                    Get.toNamed(Routes.PRICEBUTTLERBOTTOMBAR);
                  },
                  child: Text(
                    'Skip for now',
                    style: TextStyleUtil.inter400(
                      fontSize: 16.kh,
                      color: context.GreyNeutral,
                    ),
                  ),
                ),
              ],
            ).paddingOnly(left: 16.kw, right: 16.kw),
          ),
        ),
      ),
    );
  }
}
