import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pricebutler/app/components/PriceButtleAppBar.dart';
import 'package:pricebutler/app/modules/notification/views/notification_view.dart';
import 'package:pricebutler/app/services/colors.dart';
import 'package:pricebutler/app/services/responsive_size.dart';
import 'package:pricebutler/app/services/text_style_util.dart';

import '../controllers/price_alert_controller.dart';

class PriceAlertView extends GetView<PriceAlertController> {
  const PriceAlertView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PriceButtlerAppBar(
          title: Text(
            'Price Alert',
            style: TextStyleUtil.inter500(fontSize: 20.kh, color: Colors.black),
          ),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Divider(
                color: context.progressBarColor,
                thickness: 10,
                height: 8.kh,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Text(
                        'New',
                        style: TextStyleUtil.inter700(
                            fontSize: 16.kh, color: Colors.black),
                      ).paddingOnly(right: 12.kw),
                      Container(
                        decoration: BoxDecoration(
                            color: context.buttonUnfilledColor,
                            borderRadius: BorderRadius.circular(6.kw)),
                        child: Text(
                          '2',
                          style: TextStyleUtil.inter500(
                              fontSize: 12.kh, color: context.Green),
                        ).paddingSymmetric(horizontal: 12.kw),
                      )
                    ],
                  ),
                  notificationListViewBuilder(
                    showGraph: true,
                  ),
                  Row(
                    children: [
                      Text(
                        'Earlier',
                        style: TextStyleUtil.inter700(
                            fontSize: 16.kh, color: Colors.black),
                      ).paddingOnly(right: 12.kw),
                      Container(
                        decoration: BoxDecoration(
                            color: context.buttonUnfilledColor,
                            borderRadius: BorderRadius.circular(6.kw)),
                        child: Text(
                          '2',
                          style: TextStyleUtil.inter500(
                              fontSize: 12.kh, color: context.Green),
                        ).paddingSymmetric(horizontal: 12.kw),
                      )
                    ],
                  ).paddingOnly(top: 22.kh),
                  notificationListViewBuilder(
                    showGraph: true,
                  ),
                ],
              ).paddingSymmetric(horizontal: 21.kw, vertical: 24.kh)
            ],
          ),
        ));
  }
}
