import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pricebutler/app/components/PriceButtleAppBar.dart';
import 'package:pricebutler/app/components/ViewAllRow.dart';
import 'package:pricebutler/app/components/brandListviewBuilder.dart';
import 'package:pricebutler/app/components/horizontalListViewBuilder.dart';
import 'package:pricebutler/app/components/priceButlerGridViewBuilder.dart';
import 'package:pricebutler/app/constants/image_constant.dart';
import 'package:pricebutler/app/routes/app_pages.dart';
import 'package:pricebutler/app/services/colors.dart';
import 'package:pricebutler/app/services/responsive_size.dart';
import 'package:pricebutler/app/services/text_style_util.dart';
import 'package:textfield_search/textfield_search.dart';

import '../../pricebuttlerbottombar/controllers/pricebuttlerbottombar_controller.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeController());

    TextEditingController searchController = TextEditingController();
    PricebuttlerbottombarController priceController = Get.find();

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
                    child: SvgPicture.asset(ImageConstant.svgheartline))),
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.NOTIFICATION);
              },
              child: SvgPicture.asset(ImageConstant.svgnotificationline)
                  .paddingOnly(right: 24.kw, left: 16.kw),
            ),
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
                    priceButlerSearchField(
                      searchController: searchController,
                      initialList: controller.dummyList,
                      hintText: 'Search for products, brands and more...',
                      prefixIcon: Icon(
                        CupertinoIcons.search,
                        color: context.GreyNeutral,
                      ),
                      suffixIcon: Icon(
                        CupertinoIcons.mic_fill,
                        color: context.GreyNeutral,
                      ),
                    ),
                    SizedBox(
                        height: 80,
                        child: Obx(
                          () => brandListviewBuilder(
                              itemCount: controller.brandLogos.length,
                              brandLogos: controller.brandLogos),
                        )),
                  ],
                ).paddingOnly(left: 24.kw, right: 24.kw, top: 15.kh),
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
                        ).paddingOnly(top: 10.kh)
                      ],
                    ).paddingOnly(left: 27.kw, top: 34.kh),
                  ],
                ),
                Obx(
                  () => Column(
                    children: [
                      ViewAllRow(
                        label: 'Popular Categories',
                        onPressed: () {
                          priceController.selectedPageIndex.value;
                          print(priceController.changePage(1));
                        },
                      ),
                      priceButlerGridViewBuilder(
                        crossAxisCount: 3,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 6,
                        childAspectRatio: 3 / 3,
                        itemCount: controller.productsList.length,
                        productsList: controller.productsList,
                        productsName: controller.productType,
                        textStyle: TextStyleUtil.inter400(
                            fontSize: 12.kh, color: Colors.black),
                      ),
                      ViewAllRow(
                        label: 'Deal of the Day',
                        onPressed: () {
                          priceController.selectedPageIndex.value;
                          print(priceController.changePage(2));
                        },
                      ),
                      SizedBox(
                        height: 210.kh,
                        child: HorizontalListViewBuilder(
                          itemCount: 3,
                          iconStar: true,
                          cancelIcon: false,
                          compareIcon: true,
                          priceGraphIcon: true,
                          productImage: controller.productImage,
                          productNameList: controller.productsNameList,
                          productDescription: controller.productsDescription,
                          productCurrentPrice: controller.productsCurrentPrice,
                          productPastPrice: controller.productsLastPrice,
                          productTotalReview: controller.productRating,
                          productRating: controller.productTotalReview,
                        ),
                      ),
                    ],
                  ).paddingOnly(left: 24.kw, right: 24.kw, top: 36.kh),
                ),
              ],
            ),
          ),
        ));
  }
}

class priceButlerSearchField extends StatelessWidget {
  final String? hintText;
  final List? initialList;
  final TextEditingController searchController;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  const priceButlerSearchField({
    super.key,
    this.hintText,
    this.initialList,
    required this.searchController,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldSearch(
      initialList: initialList,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        contentPadding: EdgeInsets.all(13.kw),
        fillColor: const Color(0xFFF2F2F2),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.transparent)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.transparent)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.red)),
      ),
      textStyle:
          TextStyleUtil.inter400(fontSize: 14.kh, color: context.GreyNeutral),
      controller: searchController,
      label: '',
    );
  }
}
