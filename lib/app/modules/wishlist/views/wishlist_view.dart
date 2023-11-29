import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pricebutler/app/components/PriceButtleAppBar.dart';
import 'package:pricebutler/app/components/PriceButtleButton.dart';
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
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(24.kh))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.arrow_back)),
                        Text(
                          'Filter',
                          style: TextStyleUtil.inter500(
                            fontSize: 18.kh,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Clear All',
                          style: TextStyleUtil.inter400(
                              fontSize: 14, color: context.oneStarColor),
                        ))
                  ],
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SideMenu(
                        controller: controller.sideMenu,
                        style: SideMenuStyle(
                          // showTooltip: false,
                          displayMode: SideMenuDisplayMode.compact,
                          compactSideMenuWidth: 154.kw,
                          backgroundColor: Color(0xFFF2F2F2),
                          selectedColor: Colors.white,
                          selectedTitleTextStyle:
                              const TextStyle(color: Colors.red),
                          unselectedTitleTextStyle:
                              const TextStyle(color: Colors.black),
                        ),
                        items: [
                          SideMenuItem(
                            title: 'Brand',
                            icon: Icon(Icons.abc),
                            iconWidget: Text('Brand'),
                            onTap: (index, _) {
                              controller.sideMenu.changePage(index);
                            },
                            badgeContent: const Text(
                              '3',
                              style: TextStyle(color: Colors.white),
                            ),
                            tooltipContent:
                                "This is a tooltip for Dashboard item",
                          ),
                          SideMenuItem(
                            title: 'Store',
                            icon: Icon(Icons.abc),
                            iconWidget: Text('Store'),
                            onTap: (index, _) {
                              controller.sideMenu.changePage(index);
                            },
                          ),
                          SideMenuItem(
                            title: 'Category',
                            icon: Icon(Icons.abc),
                            iconWidget: Text('Category'),
                            onTap: (index, _) {
                              controller.sideMenu.changePage(index);
                            },
                          ),
                          SideMenuItem(
                            title: 'Price Range',
                            icon: Icon(Icons.abc),
                            iconWidget: Text('Price Range'),
                            onTap: (index, _) {
                              controller.sideMenu.changePage(index);
                            },
                          ),
                        ],
                      ),
                      Expanded(
                        child: PageView(
                          controller: controller.pageController,
                          scrollDirection: Axis.vertical,
                          children: [
                            Container(
                              color: Colors.white,
                              child: const Center(
                                child: Text(
                                  'Dashboard',
                                  style: TextStyle(fontSize: 35),
                                ),
                              ),
                            ),
                            Container(
                              color: Colors.white,
                              child: const Center(
                                child: Text(
                                  'Users',
                                  style: TextStyle(fontSize: 35),
                                ),
                              ),
                            ),
                            Container(
                              color: Colors.white,
                              child: const Center(
                                child: Text(
                                  'Files',
                                  style: TextStyle(
                                      fontSize: 35, color: Colors.black),
                                ),
                              ),
                            ),
                            Container(
                              color: Colors.white,
                              child: const Center(
                                child: Text(
                                  'Download',
                                  style: TextStyle(fontSize: 35),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                PriceButtlerButton(
                  onpressed: () {},
                  label: 'Apply Filter',
                  labelStyle: TextStyleUtil.dmSans500(fontSize: 18.kh),
                  color: context.buttonFillColor,
                ),
              ],
            )),
        isDismissible: true);
  }
}
