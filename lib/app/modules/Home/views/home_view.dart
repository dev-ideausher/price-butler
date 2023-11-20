import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pricebutler/app/components/PriceButlerTextField.dart';
import 'package:pricebutler/app/components/PriceButtleAppBar.dart';
import 'package:pricebutler/app/components/ViewAllRow.dart';
import 'package:pricebutler/app/components/brandListviewBuilder.dart';
import 'package:pricebutler/app/components/horizontalListViewBuilder.dart';
import 'package:pricebutler/app/components/priceButlerGridViewBuilder.dart';
import 'package:pricebutler/app/constants/image_constant.dart';
import 'package:pricebutler/app/services/colors.dart';
import 'package:pricebutler/app/services/responsive_size.dart';
import 'package:pricebutler/app/services/text_style_util.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeController());
    return Scaffold(
        appBar: PriceButtlerAppBar(
          elevation: 1,
          color: Colors.white,
          actions: [
            SvgPicture.asset(ImageConstant.svgheartline),
            SvgPicture.asset(ImageConstant.svgnotificationline)
                .paddingOnly(right: 24.kw, left: 16.kw),
          ],
          leading: Center(
            child: Text(
              'Logo',
              style:
                  TextStyleUtil.inter700(fontSize: 20.kh, color: context.Green),
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    PriceButlerTextField(
                      prefixIcon: Icon(
                        CupertinoIcons.search,
                        color: context.GreyNeutral,
                      ),
                      suffixIcon: Icon(
                        CupertinoIcons.mic_fill,
                        color: context.GreyNeutral,
                      ),
                      hintText: 'Search for products, brands and more...',
                      textStyle: TextStyleUtil.inter400(
                          fontSize: 14.kh, color: context.GreyNeutral),
                    ),
                    Container(
                        height: 80,
                        child: Obx(
                          () => brandListviewBuilder(
                              itemCount: controller.brandLogos.length,
                              brandLogos: controller.brandLogos),
                        )),
                  ],
                ).paddingOnly(left: 24.kw, right: 24.kw, top: 15.kw),
                Stack(
                  children: [
                    Image.asset(ImageConstant.pnghomescreencard),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("50-40% OFF",
                            style: TextStyleUtil.robotoCondensed700(
                              fontSize: 24.kh,
                              color: Colors.white,
                            )),
                        Text(
                          'Now in (product)',
                          style: TextStyleUtil.inter400(
                            fontSize: 12.kh,
                          ),
                        ),
                        Text(
                          'All colors',
                          style: TextStyleUtil.inter400(
                            fontSize: 12.kh,
                          ),
                        ),
                        Container(
                          height: 32.kh,
                          width: 100.kw,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.white)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Shop Now',
                                style: TextStyleUtil.dmSans500(fontSize: 12.kh),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 16.kh,
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
                ViewAllRow(
                  label: 'Popular Categories',
                  onPressed: () {},
                ),
                priceButlerGridViewBuilder(
                  crossAxisCount: 3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 6,
                  itemCount: controller.productsList.length,
                  productsList: controller.productsList,
                  productsName: controller.productsName,
                  textStyle: TextStyleUtil.inter400(
                      fontSize: 12.kh, color: Colors.black),
                ),
                ViewAllRow(
                  label: 'Deal Of The Day',
                  onPressed: () {},
                ),
                Container(
                  height: 210.kh,
                  child: HorizontalListViewBuilder(
                    itemCount: 3,
                    productImage: controller.productImage,
                    productNameList: controller.productsNameList,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
