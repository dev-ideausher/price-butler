import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pricebutler/app/components/PriceButlerTextField.dart';
import 'package:pricebutler/app/components/PriceButtleAppBar.dart';
import 'package:pricebutler/app/components/priceButtlerLogo.dart';
import 'package:pricebutler/app/routes/app_pages.dart';
import 'package:pricebutler/app/services/colors.dart';
import 'package:pricebutler/app/services/responsive_size.dart';
import 'package:pricebutler/app/services/text_style_util.dart';

import '../../../components/PriceButtleButton.dart';
import '../../../components/SocialMediaLoginRow.dart';
import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SignUpController());
    return Scaffold(
        appBar: PriceButtlerAppBar(
          elevation: 0,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              priceButtlerLogo(),
              Text(
                'Create New Account',
                style: TextStyleUtil.inter700(
                    fontSize: 24.kh, color: Colors.black),
              ).paddingOnly(top: 15.kh, bottom: 43.kh),
              PriceButlerTextField(
                prefixIcon: Icon(CupertinoIcons.person),
                hintText: 'Name',
                controller: controller.nameController,
                onChanged: (value) => controller.name.value = value,
              ).paddingOnly(
                bottom: 16.kh,
              ),
              PriceButlerTextField(
                prefixIcon: Icon(CupertinoIcons.phone),
                hintText: 'Phone',
                controller: controller.phoneNumberController,
                onChanged: (value) => controller.phoneNumber.value = value,
                textInputType: TextInputType.numberWithOptions(),
              ).paddingOnly(
                bottom: 16.kh,
              ),
              Row(
                children: [
                  Obx(
                    () => Checkbox(
                      value: controller.isTicked.value, // Use controller value

                      activeColor: context.Green,
                      onChanged: (value) {
                        controller.isTicked.value = value ?? false;
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  Text(
                      'By clicking, you agree to our Terms and\nConditions & Privacy policy.'),
                ],
              ).paddingOnly(
                bottom: 43.kh,
              ),
              Obx(
                () => PriceButtlerButton(
                  onpressed: () {
                    controller.phoneNumber.isNotEmpty &&
                            controller.name.isNotEmpty
                        ? controller.handleButtonPress()
                        : null;
                    print(controller.phoneNumber);
                  },
                  color: controller.phoneNumber.isNotEmpty &&
                          controller.name.isNotEmpty
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
              ).paddingOnly(top: 31.kh, bottom: 24.kh),
              SocialMedialLoginRow(),
              RichText(
                text: TextSpan(
                  text: "Already have an account? ",
                  style: TextStyleUtil.inter400(
                    fontSize: 16.kh,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: 'Log In',
                      style: TextStyleUtil.inter700(
                        fontSize: 16.kh,
                        color: context.brandColor1,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.toNamed(Routes.SIGN_IN);
                        },
                    ),
                  ],
                ),
              ).paddingOnly(top: 10.kh, bottom: 31.kh),
              TextButton(
                onPressed: () {},
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
        )));
  }
}
