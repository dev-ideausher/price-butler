import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:pricebutler/app/components/PriceButtleAppBar.dart';
import 'package:pricebutler/app/components/PriceButtleButton.dart';
import 'package:pricebutler/app/components/common_image_view.dart';
import 'package:pricebutler/app/constants/image_constant.dart';
import 'package:pricebutler/app/services/colors.dart';
import 'package:pricebutler/app/services/responsive_size.dart';
import 'package:pricebutler/app/services/text_style_util.dart';

import '../controllers/login_otp_authentication_controller.dart';

class LoginOtpAuthenticationView
    extends GetView<LoginOtpAuthenticationController> {
  final phoneNumber = Get.arguments;
  LoginOtpAuthenticationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
              CommonImageView(
                svgPath: ImageConstant.svgLoginOtpVerification,
              ),
              Text(
                'Verify Phone Number',
                style:
                    TextStyleUtil.inter700(fontSize: 24, color: Colors.black),
              ).paddingOnly(top: 40.kh, bottom: 16.kh),
              Text(
                'Please enter the verification code send to ${phoneNumber['phoneNumber']}',
                textAlign: TextAlign.center,
                style: TextStyleUtil.inter400(
                    fontSize: 16, color: context.GreyNeutral),
              ),
              OtpTextField(
                numberOfFields: 6,
                fieldWidth: 50.kw,
                filled: true,
                fillColor: context.primaryLightGreen03,
                showFieldAsBox: true,
                focusedBorderColor: context.Green,
                borderRadius: BorderRadius.circular(8.kw),
                onCodeChanged: (String code) {
                  controller.otp.value = code;
                },
                onSubmit: (code) {
                  controller.otp.value = code;
                },
              ).paddingOnly(top: 38.kh, bottom: 16.kh),
              RichText(
                text: TextSpan(
                  text: "Didn't get any code? ",
                  style: TextStyleUtil.inter400(
                    fontSize: 16.kh,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: 'Resend',
                      style: TextStyleUtil.inter700(
                        fontSize: 16.kh,
                        color: context.brandColor1,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                  ],
                ),
              ).paddingOnly(top: 10.kh, bottom: 31.kh),
              PriceButtlerButton(
                  onpressed: () {
                    controller.verifyOTP();
                  },
                  label: 'Verify Otp',
                  labelStyle: TextStyleUtil.inter400(fontSize: 16.kh),
                  color: context.Green)
            ],
          ).paddingOnly(left: 16.kw, right: 16.kw),
        ),
      ),
    );
  }
}
