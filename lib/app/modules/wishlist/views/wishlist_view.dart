import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pricebutler/app/components/PriceButtleAppBar.dart';
import 'package:pricebutler/app/components/common_image_view.dart';
import 'package:pricebutler/app/components/priceButlerGridViewBuilder.dart';
import 'package:pricebutler/app/constants/image_constant.dart';
import 'package:pricebutler/app/services/colors.dart';
import 'package:pricebutler/app/services/responsive_size.dart';
import 'package:pricebutler/app/services/text_style_util.dart';

import '../controllers/wishlist_controller.dart';

class WishlistView extends GetView<WishlistController> {
  const WishlistView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                color: context.Green,
                borderRadius: BorderRadius.circular(8.kw)),
            child: Row(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        _showSortBottomSheet(context);
                      },
                      icon: CommonImageView(
                        svgPath: ImageConstant.svgsort,
                        svgColor: Colors.white,
                      ),
                      label: Text(
                        'Sort',
                        style: TextStyleUtil.inter400(fontSize: 14.kh),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 31.kh,
                  child: VerticalDivider(
                    thickness: 1,
                    width: 31.kw,
                    color: Colors.white,
                  ),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: CommonImageView(
                    svgPath: ImageConstant.svgfliter,
                    svgColor: Colors.white,
                  ),
                  label: Text(
                    'Filter',
                    style: TextStyleUtil.inter400(fontSize: 14.kh),
                  ),
                ),
              ],
            ),
          )
        ],
      ).paddingOnly(bottom: 20),
      appBar: PriceButtlerAppBar(
        elevation: 0,
        title: Text(
          'Wishlist',
          style: TextStyleUtil.inter500(fontSize: 20.kh, color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.search,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            Divider(
              color: context.progressBarColor,
              thickness: 10,
              height: 8.kh,
            ),
            Column(
              children: [
                wishListGridViewBuilder(
                  crossAxisCount: 2,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 18.kh,
                  childAspectRatio: 0.6,
                  itemCount: 4,
                  productsList: controller.productsList,
                  productsName: controller.productsName,
                  productDescription: controller.productsDescription,
                  textStyle: TextStyleUtil.inter700(
                    fontSize: 12.kh,
                    color: Colors.black,
                  ),
                  productCurrentPrice: controller.productsCurrentPrice,
                  productPastPrice: controller.productsLastPrice,
                  productTotalReview: controller.productTotalReview,
                  productRating: controller.productRating,
                  availableStores: controller.availableStores,
                )
              ],
            ).paddingOnly(left: 24.kw, right: 24.kw),
          ],
        )),
      ),
    );
  }

  void _showSortBottomSheet(BuildContext context) {
    final SideMenuController sideMenuController = SideMenuController();
    Get.bottomSheet(
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24.kh))),
          child: Obx(
            () => Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 150.kw,
                  child: NavigationRail(
                    selectedIndex: controller.currentIndex.value,
                    indicatorColor: Colors.red,
                    groupAlignment: 1,
                    unselectedLabelTextStyle: TextStyleUtil.inter400(
                        fontSize: 10, color: Colors.black),
                    selectedLabelTextStyle: TextStyleUtil.inter400(
                        fontSize: 10, color: context.Green),
                    backgroundColor: const Color(0xFFEFF1F4),
                    onDestinationSelected: (int index) {
                      controller.currentIndex.value = index;
                      controller.changePage(index);
                    },
                    destinations: <NavigationRailDestination>[
                      NavigationRailDestination(
                          icon: Text(
                            'Brand',
                            style: TextStyleUtil.inter500(
                                fontSize: 14.kh, color: Colors.black),
                          ),
                          selectedIcon: Text(
                            'Brand',
                            style: TextStyleUtil.inter500(
                                fontSize: 14.kh, color: Colors.black),
                          ).paddingOnly(
                              left: 24.kw,
                              right: 24.kw,
                              top: 12.kw,
                              bottom: 12.kw),
                          label: const SizedBox()),
                      NavigationRailDestination(
                        icon: Text(
                          'Stores',
                          style: TextStyleUtil.inter500(
                              fontSize: 14.kh, color: Colors.black),
                        ),
                        selectedIcon: Text(
                          'Stores',
                          style: TextStyleUtil.inter500(
                              fontSize: 14.kh, color: Colors.black),
                        ),
                        label: const SizedBox(),
                      ),
                      NavigationRailDestination(
                        icon: Text(
                          'Categories',
                          style: TextStyleUtil.inter500(
                              fontSize: 14.kh, color: Colors.black),
                        ),
                        selectedIcon: Text(
                          'Categories',
                          style: TextStyleUtil.inter500(
                              fontSize: 14.kh, color: Colors.black),
                        ),
                        label: const SizedBox(),
                      ),
                      NavigationRailDestination(
                        icon: Text(
                          'Price Range',
                          style: TextStyleUtil.inter500(
                              fontSize: 14.kh, color: Colors.black),
                        ),
                        selectedIcon: Text(
                          'Price Range',
                          style: TextStyleUtil.inter500(
                              fontSize: 14.kh, color: Colors.black),
                        ),
                        label: const SizedBox(),
                      ),
                    ],
                    labelType: NavigationRailLabelType.values[2],
                  ),
                ),
                Expanded(
                  child: PageView(
                    controller: controller.pageController,
                    physics: NeverScrollableScrollPhysics(),
                    children: [Text('test')],
                  ),
                ),
              ],
            ),
          ),
        ),
        isDismissible: true);
  }
}
