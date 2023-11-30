import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pricebutler/app/components/PriceButtleAppBar.dart';
import 'package:pricebutler/app/services/colors.dart';
import 'package:pricebutler/app/services/responsive_size.dart';
import 'package:pricebutler/app/services/text_style_util.dart';

import '../controllers/aboutus_controller.dart';

class AboutusView extends GetView<AboutusController> {
  const AboutusView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PriceButtlerAppBar(
          elevation: 1,
          color: Colors.white,
          title: Text(
            'About Us',
            style: TextStyleUtil.inter500(fontSize: 20.kh, color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'About PriceButlers',
                    style: TextStyleUtil.inter700(
                        fontSize: 18.kh, color: Colors.black),
                  ).paddingOnly(bottom: 12.kh),
                  Text(
                    'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\n\nThe point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters',
                    style: TextStyleUtil.inter400(
                        fontSize: 14.kh, color: context.GreyNeutral),
                  ),
                ],
              ).paddingOnly(left: 24.kw, right: 42.kw, top: 31.kh),
              Divider(
                thickness: 8.kh,
                height: 44.kh,
                color: context.progressBarColor,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'How we started?',
                    style: TextStyleUtil.inter700(
                        fontSize: 18.kh, color: Colors.black),
                  ).paddingOnly(bottom: 12.kh),
                  Text(
                    'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\n\nThe point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters',
                    style: TextStyleUtil.inter400(
                        fontSize: 14.kh, color: context.GreyNeutral),
                  ),
                ],
              ).paddingOnly(
                left: 24.kw,
                right: 42.kw,
              ),
            ],
          ),
        ));
  }
}
