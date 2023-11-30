import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pricebutler/app/components/PriceButtleAppBar.dart';
import 'package:pricebutler/app/components/priceButlerGridViewBuilder.dart';
import 'package:pricebutler/app/services/responsive_size.dart';
import 'package:pricebutler/app/services/text_style_util.dart';

import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PriceButtlerAppBar(
          elevation: 1,
          color: Colors.white,
          title: Text(
            'History',
            style: TextStyleUtil.inter500(fontSize: 20.kw, color: Colors.black),
          ),
        ),
        body: Column(
          children: [
            wishListGridViewBuilder(
              crossAxisCount: 2,
              crossAxisSpacing: 1,
              mainAxisSpacing: 3,
              itemCount: 3,
              childAspectRatio: 2 / 3,
              productsList: controller.productsList,
              productsName: controller.productsName,
              textStyle:
                  TextStyleUtil.inter400(fontSize: 12.kh, color: Colors.black),
              productDescription: controller.productsDescription,
              productCurrentPrice: controller.productsCurrentPrice,
              productPastPrice: controller.productsLastPrice,
              productTotalReview: controller.productTotalReview,
              productRating: controller.productRating,
              availableStores: controller.availableStores,
            )
          ],
        ).paddingSymmetric(horizontal: 12.kw, vertical: 12.kw));
  }
}
