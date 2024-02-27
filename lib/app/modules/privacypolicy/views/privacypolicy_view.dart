import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pricebutler/app/services/responsive_size.dart';

import '../../../components/PriceButtleAppBar.dart';
import '../../../services/text_style_util.dart';
import '../controllers/privacypolicy_controller.dart';

class PrivacypolicyView extends GetView<PrivacypolicyController> {
  const PrivacypolicyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PriceButtlerAppBar(
          elevation: 1,
          color: Colors.white,
          title: Text(
            'Privacy Policy',
            style: TextStyleUtil.inter500(fontSize: 20.kh, color: Colors.black),
          ),
          centerTile: true,
        ),
        body: Obx(
          () => controller.allPrivacyPolicy.value == null
              ? Center(child: CircularProgressIndicator())
              : Center(
                  child: SingleChildScrollView(
                    child: Text(
                      controller.allPrivacyPolicy.value!.content!.content
                          .toString(),
                      style: TextStyleUtil.inter500(
                          fontSize: 18.kh, color: Colors.black),
                    ).paddingOnly(
                        left: 16.kw, right: 16.kw, top: 16.kh, bottom: 16.kh),
                  ),
                ),
        ));
  }
}
