import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pricebutler/app/components/PriceButtleAppBar.dart';
import 'package:pricebutler/app/services/colors.dart';
import 'package:pricebutler/app/services/responsive_size.dart';
import 'package:pricebutler/app/services/text_style_util.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PriceButtlerAppBar(
          elevation: 0,
          title: Text(
            'Settings',
            style: TextStyleUtil.inter500(fontSize: 20.kh, color: Colors.black),
          ),
        ),
        body: Obx(
          () => Column(
            children: [
              CheckboxListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Push Notifications',
                        style: TextStyleUtil.inter500(
                            fontSize: 16.kh, color: Colors.black),
                      ),
                      Text(
                        'Disable to turn off notifications',
                        style: TextStyleUtil.inter400(
                            fontSize: 14.kh, color: context.GreyNeutral),
                      )
                    ],
                  ),
                  activeColor: context.Green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.kw)),
                  value: controller.isPushNotificationEnabled.value,
                  onChanged: (value) {
                    controller.isPushNotificationEnabled(value);
                  }),
              CheckboxListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Price Alert Notifications',
                        style: TextStyleUtil.inter500(
                            fontSize: 16.kh, color: Colors.black),
                      ),
                      Text(
                        'Disable to turn off notifications',
                        style: TextStyleUtil.inter400(
                            fontSize: 14.kh, color: context.GreyNeutral),
                      )
                    ],
                  ),
                  activeColor: context.Green,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.kw)),
                  value: controller.isPriceAlertEnabled.value,
                  onChanged: (value) {
                    controller.isPriceAlertEnabled(value);
                  })
            ],
          ),
        ));
  }
}
