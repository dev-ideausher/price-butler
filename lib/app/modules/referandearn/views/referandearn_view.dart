import 'package:bulleted_list/bulleted_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotted/flutter_dotted.dart';
import 'package:get/get.dart';
import 'package:pricebutler/app/components/PriceButtleAppBar.dart';
import 'package:pricebutler/app/components/PriceButtleButton.dart';
import 'package:pricebutler/app/components/common_image_view.dart';
import 'package:pricebutler/app/constants/image_constant.dart';
import 'package:pricebutler/app/services/colors.dart';
import 'package:pricebutler/app/services/responsive_size.dart';
import 'package:pricebutler/app/services/text_style_util.dart';

import '../../producDetails/views/produc_details_view.dart';
import '../controllers/referandearn_controller.dart';

class ReferandearnView extends GetView<ReferandearnController> {
  const ReferandearnView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PriceButtlerAppBar(
        elevation: 0,
        color: context.Green,
      ),
      body: SingleChildScrollView(
        child: Container(
            decoration: BoxDecoration(color: context.Green),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CommonImageView(
                  imagePath: ImageConstant.pngrefer,
                ),
                Center(
                  child: Text(
                    'Refer And Earn',
                    style: TextStyleUtil.inter700(fontSize: 24.kh),
                  ),
                ),
                Center(
                    child: Text(
                  'Refer to your friend and get a reward of\n50 Super coins',
                  textAlign: TextAlign.center,
                  style: TextStyleUtil.inter400(fontSize: 16.kh),
                )).paddingOnly(bottom: 20.kh),
                ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(20)),
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Referral Code',
                            style: TextStyleUtil.inter700(
                                fontSize: 16.kh, color: Colors.black),
                          ).paddingOnly(bottom: 9.kh),
                          FlutterDotted(
                            color: context.oneStarColor,
                            child: Container(
                              decoration:
                                  BoxDecoration(color: context.cyanLight),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'CA545A',
                                        style: TextStyleUtil.inter500(
                                            fontSize: 20.kh,
                                            color: Colors.black),
                                      ).paddingOnly(right: 36.kw),
                                      Icon(Icons.copy_sharp)
                                    ],
                                  ).paddingSymmetric(
                                      horizontal: 16.kw, vertical: 12.kh),
                                ],
                              ),
                            ),
                          ).paddingOnly(bottom: 35.kh),
                          Text(
                            'How does it work?',
                            style: TextStyleUtil.inter700(
                                fontSize: 16.kh, color: Colors.black),
                          ).paddingOnly(bottom: 16.kh),
                          BulletedList(
                            listItems: [
                              'It is a long established fact that a reader will be distracted by the ?',
                              'It is a long established fact that a reader will be distracted by the ?',
                              'It is a long established fact that a reader will be distracted by the ?'
                            ],
                          ),
                          PriceButtlerButton(
                                  onpressed: () {
                                    showShareBottomSheet();
                                  },
                                  label: 'Refer Now',
                                  labelStyle:
                                      TextStyleUtil.dmSans500(fontSize: 18.kh),
                                  color: context.buttonFillColor)
                              .paddingOnly(
                                  left: 12.kw, right: 12.kw, top: 35.kh)
                        ],
                      ).paddingOnly(top: 38.kh),
                    ))
              ],
            )),
      ),
    );
  }
}
