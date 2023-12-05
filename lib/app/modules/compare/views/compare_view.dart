import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pricebutler/app/components/PriceButtleAppBar.dart';
import 'package:pricebutler/app/components/PriceButtleButton.dart';
import 'package:pricebutler/app/constants/image_constant.dart';
import 'package:pricebutler/app/services/colors.dart';
import 'package:pricebutler/app/services/responsive_size.dart';
import 'package:pricebutler/app/services/text_style_util.dart';

import '../../../components/horizontalListViewBuilder.dart';
import '../../../routes/app_pages.dart';
import '../controllers/compare_controller.dart';

class CompareView extends GetView<CompareController> {
  const CompareView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CompareController());
    return Scaffold(
      appBar: PriceButtlerAppBar(
        elevation: 1,
        color: Colors.white,
        actions: [
          GestureDetector(
                  child: GestureDetector(
                      onTap: () {
                        Get.toNamed(
                          Routes.WISHLIST,
                        );
                      },
                      child: SvgPicture.asset(ImageConstant.svgheartline)))
              .paddingOnly(right: 24.kw),
        ],
        title: Text(
          'Compare',
          style: TextStyleUtil.inter500(fontSize: 20.kh, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                    height: 209.kh,
                    child: HorizontalListViewBuilder(
                      width: 178.kw,
                      itemCount: 2,
                      iconStar: true,
                      cancelIcon: true,
                      compareIcon: true,
                      priceGraphIcon: true,
                      productImage: controller.productImage,
                      productNameList: controller.productsNameList,
                      productDescription: controller.productsDescription,
                      productCurrentPrice: controller.productsCurrentPrice,
                      productPastPrice: controller.productsLastPrice,
                      productTotalReview: controller.productRating,
                      productRating: controller.productTotalReview,
                    )).paddingOnly(bottom: 22.kh),
                PriceButtlerButton(
                    onpressed: () {
                      controller.productsNameList.length == 4
                          ? Get.dialog(addProductAlert())
                          : SizedBox();
                    },
                    label: 'Add Product',
                    labelStyle: TextStyleUtil.inter400(
                        fontSize: 16.kh, color: context.buttonFillColor),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: context.buttonFillColor),
                      borderRadius: BorderRadius.circular(8.kw),
                    ),
                    color: context.buttonUnfilledColor),
              ],
            ).paddingSymmetric(horizontal: 24.kh),
            Divider(
              height: 17.kh,
              thickness: 8.kh,
              color: context.progressBarColor,
            ).paddingOnly(bottom: 30.kh),
            const compareDetails(
              title: 'General',
              label: 'Brand',
              product1Description: 'Apple',
              product2Description: 'Apple',
            ).paddingOnly(bottom: 21.kh),
            const compareDetails(
              title: 'Design & Body',
              label: 'Weight',
              product1Description: 'SE 2nd Gen',
              product2Description: 'Watch Ultar',
            ),
            const compareDetails(
              islabel: false,
              label: 'Material',
              product1Description: 'Titanium',
              product2Description: 'Titanium',
            ),
            const compareDetails(
              islabel: true,
              title: 'Display',
              label: 'Type',
              product1Description: 'Color OLED',
              product2Description: 'Color OLED',
            ),
            const compareDetails(
              islabel: false,
              label: 'Touch',
              product1Description: 'Yes',
              product2Description: 'Yes',
            ),
            const compareDetails(
              islabel: false,
              label: 'Size',
              product1Description: 'Rectangular',
              product2Description: 'Rectangular',
            ),
            const compareDetails(
              islabel: false,
              label: 'Resolution',
              product1Description: '448x368 pixels',
              product2Description: '502x368 pixels',
            ),
          ],
        ),
      ),
    );
  }
}

class addProductAlert extends StatelessWidget {
  const addProductAlert({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(36.kw)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.xmark,
                color: Colors.black,
                size: 24.kw,
              )),
          Center(
            child: Text(
              'Alert',
              textAlign: TextAlign.center,
              style:
                  TextStyleUtil.inter700(fontSize: 24.kh, color: Colors.black),
            ),
          ),
          Text(
            'You can’t compare more than 4 products at a time',
            style: TextStyleUtil.inter400(fontSize: 14.kh, color: Colors.black),
          ).paddingOnly(top: 9.kh, bottom: 23.kh),
          PriceButtlerButton(
              onpressed: () {
                Get.back();
              },
              label: 'OK',
              labelStyle:
                  TextStyleUtil.inter400(fontSize: 16.kh, color: Colors.white),
              color: context.Green),
        ],
      ),
    );
  }
}

class compareDetails extends StatelessWidget {
  final String? title;
  final String? label;
  final bool? islabel;
  final String? modelName;
  final String? material;
  final String? shape;
  final String? product1Description;
  final String? product2Description;
  const compareDetails({
    super.key,
    this.title,
    this.label,
    this.modelName,
    this.material,
    this.shape,
    this.islabel = true,
    this.product1Description,
    this.product2Description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        islabel == true
            ? Center(
                child: Text(
                  title!,
                  style: TextStyleUtil.inter700(
                      fontSize: 14.kh, color: Colors.black),
                ),
              )
            : SizedBox(),
        islabel == true
            ? Container(
                height: 1,
                color: Colors.black,
              )
            : SizedBox(),
        Container(
          color: context.cyanLight,
          child: Center(
            child: Text(
              label!,
              style: TextStyleUtil.inter500(
                  fontSize: 12.kh, color: context.oneStarColor),
            ).paddingSymmetric(vertical: 11.kh),
          ),
        ),
        Container(
          color: Colors.white,
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                product1Description ?? '',
                style: TextStyleUtil.inter400(
                    fontSize: 12.kh, color: Colors.black),
              ),
              SizedBox(
                height: 31,
                child: VerticalDivider(
                  thickness: 2,
                  color: context.cyanLight,
                ),
              ),
              Text(
                product2Description ?? '',
                style: TextStyleUtil.inter400(
                    fontSize: 12.kh, color: Colors.black),
              )
            ],
          )),
        ),
      ],
    );
  }
}
