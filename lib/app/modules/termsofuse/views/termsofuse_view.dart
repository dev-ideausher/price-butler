import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pricebutler/app/services/responsive_size.dart';

import '../../../components/PriceButtleAppBar.dart';
import '../../../services/text_style_util.dart';
import '../controllers/termsofuse_controller.dart';

class TermsofuseView extends GetView<TermsofuseController> {
  const TermsofuseView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PriceButtlerAppBar(
        elevation: 1,
        color: Colors.white,
        title: Text('Terms And Condition',
            style:
                TextStyleUtil.inter500(fontSize: 20.kh, color: Colors.black)),
      ),
      body: Obx(
        () => controller.termsandcondition.value == null
            ? Center(child: CircularProgressIndicator())
            : Center(
                child: SingleChildScrollView(
                  child: Text(
                    controller.termsandcondition.value!.content!.content
                        .toString(),
                    style: TextStyleUtil.inter500(
                        fontSize: 18.kh, color: Colors.black),
                  ).paddingOnly(
                      left: 16.kw, right: 16.kw, top: 16.kh, bottom: 16.kh),
                ),
              ),
      ),
    );
  }
}
