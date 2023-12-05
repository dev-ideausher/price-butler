import 'package:another_xlider/another_xlider.dart';
import 'package:another_xlider/models/handler.dart';
import 'package:another_xlider/models/tooltip/tooltip.dart';
import 'package:another_xlider/models/tooltip/tooltip_box.dart';
import 'package:another_xlider/models/trackbar.dart';
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
import 'package:textfield_search/textfield_search.dart';

import '../controllers/wishlist_controller.dart';

class WishlistView extends GetView<WishlistController> {
  WishlistView({Key? key}) : super(key: key);
  //TextEditingController searchController = TextEditingController();
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
                  onPressed: () {
                    _showFilterBottomSheet(
                        context, controller.searchController);
                  },
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
            icon: const Icon(
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

  void _showFilterBottomSheet(
      BuildContext context, TextEditingController searchController) {
    final SideMenuController sideMenuController = SideMenuController();

    Get.bottomSheet(
        DraggableScrollableSheet(
            initialChildSize: 0.8,
            builder: (BuildContext context, ScrollController scrollController) {
              return ClipRRect(
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(24.kh)),
                child: Scaffold(
                  appBar: PriceButtlerAppBar(
                    elevation: 0,
                    color: Colors.white,
                    title: Text(
                      'Filter',
                      style: TextStyleUtil.inter500(
                          fontSize: 18.kh, color: Colors.black),
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Clear All',
                            style: TextStyleUtil.inter400(
                                fontSize: 14.kh, color: context.oneStarColor),
                          )).paddingOnly(right: 24.kw)
                    ],
                  ),
                  body: Obx(
                    () => Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: 150.kw,
                          child: NavigationRail(
                            selectedIndex: controller.currentIndex.value,
                            indicatorColor: Colors.red,
                            selectedIconTheme: IconThemeData(color: Colors.red),
                            groupAlignment: -1,
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
                                  selectedIcon: Container(
                                    width: 170.kw,
                                    color: Colors.white,
                                    child: Center(
                                        child: Text(
                                      'Brand',
                                      style: TextStyleUtil.inter500(
                                          fontSize: 14.kh, color: Colors.black),
                                    ).paddingSymmetric(vertical: 15.kh)),
                                  ),
                                  label: const SizedBox()),
                              NavigationRailDestination(
                                icon: Text(
                                  'Stores',
                                  style: TextStyleUtil.inter500(
                                      fontSize: 14.kh, color: Colors.black),
                                ),
                                selectedIcon: Container(
                                  width: 160.kw,
                                  color: Colors.white,
                                  child: Center(
                                    child: Text(
                                      'Stores',
                                      style: TextStyleUtil.inter500(
                                          fontSize: 14.kh, color: Colors.black),
                                    ).paddingSymmetric(vertical: 20.kw),
                                  ),
                                ),
                                label: const SizedBox(),
                              ),
                              NavigationRailDestination(
                                icon: Text(
                                  'Categories',
                                  style: TextStyleUtil.inter500(
                                      fontSize: 14.kh, color: Colors.black),
                                ),
                                selectedIcon: Container(
                                  width: 160.kw,
                                  color: Colors.white,
                                  child: Center(
                                    child: Text(
                                      'Categories',
                                      style: TextStyleUtil.inter500(
                                          fontSize: 14.kh, color: Colors.black),
                                    ).paddingSymmetric(vertical: 15.kw),
                                  ),
                                ),
                                label: const SizedBox(),
                              ),
                              NavigationRailDestination(
                                icon: Text(
                                  'Price Range',
                                  style: TextStyleUtil.inter500(
                                      fontSize: 14.kh, color: Colors.black),
                                ),
                                selectedIcon: Container(
                                  width: 160.kw,
                                  color: Colors.white,
                                  child: Center(
                                    child: Text(
                                      'Price Range',
                                      style: TextStyleUtil.inter500(
                                          fontSize: 14.kh, color: Colors.black),
                                    ).paddingSymmetric(vertical: 15.kw),
                                  ),
                                ),
                                label: const SizedBox(),
                              ),
                            ],
                            labelType: NavigationRailLabelType.selected,
                          ),
                        ),
                        Expanded(
                          child: PageView(
                            controller: controller.pageController,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              listofbrands(
                                controller: controller,
                              ).paddingOnly(
                                  left: 13.kw, right: 30.kw, top: 17.kh),
                              const Text('List of Stores'),
                              const Text('List of Categories'),
                              priceRange(context).paddingOnly(
                                  left: 13.kw, right: 30.kw, top: 17.kh),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
        isDismissible: true,
        isScrollControlled: true);
  }

  Column priceRange(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Select Price Range',
          style: TextStyleUtil.inter500(fontSize: 14.kh, color: Colors.black),
        ).paddingOnly(bottom: 10.kh),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\$${controller.sliderValues[0].toString()} \- \$${controller.sliderValues[1].toString()}',
              style:
                  TextStyleUtil.inter700(fontSize: 14.kh, color: Colors.black),
            ),
          ],
        ),
        FlutterSlider(
          values: controller.sliderValues,
          rangeSlider: true,
          max: 3000,
          min: 0,
          trackBar: FlutterSliderTrackBar(
            activeTrackBar: BoxDecoration(
              color: context.Green,
            ),
          ),
          tooltip: FlutterSliderTooltip(
              textStyle: const TextStyle(color: Colors.transparent),
              boxStyle: const FlutterSliderTooltipBox(
                decoration: BoxDecoration(),
              ),
              alwaysShowTooltip: false),
          handler: FlutterSliderHandler(
            decoration: const BoxDecoration(),
            child: Container(
              height: 20.kh,
              width: 20.kw,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(color: context.Green)),
            ),
          ),
          rightHandler: FlutterSliderHandler(
            decoration: const BoxDecoration(),
            child: Container(
              height: 20.kh,
              width: 20.kw,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(color: context.Green)),
            ),
          ),
          onDragging: (handlerIndex, lowerValue, upperValue) {
            controller.onDragging(handlerIndex, lowerValue, upperValue);
          },
        ),
      ],
    );
  }
}

class listofbrands extends StatelessWidget {
  //final TextEditingController searchController;
  final WishlistController controller;

  listofbrands({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFieldSearch(
            label: '',
            controller: searchController,
            initialList: controller.dummyList,
            textStyle: TextStyleUtil.inter400(
                fontSize: 14.kh, color: context.GreyNeutral),
            decoration: InputDecoration(
              hintText: 'Search ',
              prefixIcon: Icon(
                CupertinoIcons.search,
                color: context.GreyNeutral,
              ),
            ),
          ).paddingOnly(bottom: 12.kw),
          Obx(() => Row(
                children: [
                  Checkbox(
                    value: controller.selectAll.value,
                    activeColor: context.Green,
                    onChanged: (value) {
                      controller.selectAll.value = value!;

                      for (int i = 0;
                          i < controller.itemSelectedStates.length;
                          i++) {
                        controller.itemSelectedStates[i].value = value;
                      }
                    },
                  ),
                  Text(
                    'Select All',
                    style: TextStyleUtil.inter500(
                      fontSize: 14.kh,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    ' (72)',
                    style: TextStyleUtil.inter400(
                      fontSize: 14.kh,
                      color: Colors.black,
                    ),
                  ),
                ],
              )),
          ListView.builder(
              itemCount: controller.itemSelectedStates.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Obx(
                  () => GestureDetector(
                    onTap: () {
                      // Handle the tap event here and update the color
                      controller.changeItemSelectedState(index);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.check,
                              size: 20.kh,
                              color: controller.itemSelectedStates[index].value
                                  ? Colors.green
                                  : const Color(0xFFADADAD),
                            ).paddingOnly(right: 12.kw),
                            Text(
                              'Akaar',
                              style: TextStyleUtil.inter400(
                                fontSize: 14.kh,
                                color:
                                    controller.itemSelectedStates[index].value
                                        ? Colors.green
                                        : Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '21',
                          style: TextStyleUtil.inter400(
                            fontSize: 14.kh,
                            color: controller.itemSelectedStates[index].value
                                ? Colors.green
                                : const Color(0xFFADADAD),
                          ),
                        ),
                      ],
                    ),
                  ).paddingOnly(right: 30.kw, top: 17.kh),
                );
              })
        ],
      ),
    );
  }
}

void _showSortBottomSheet(BuildContext context) {
  Get.bottomSheet(Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.kw))),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Sort By',
              style:
                  TextStyleUtil.inter500(fontSize: 18.kh, color: Colors.black),
            ),
            Icon(
              CupertinoIcons.xmark,
              size: 24.kh,
              color: Colors.black,
            )
          ],
        ).paddingOnly(right: 30.kw),
        Text(
          'What\'s New',
          style: TextStyleUtil.inter500(fontSize: 14.kh, color: Colors.black),
        ),
        Text(
          'Price - low to high',
          style: TextStyleUtil.inter500(fontSize: 14.kh, color: Colors.black),
        ),
        Text(
          'Price - high to low',
          style: TextStyleUtil.inter500(fontSize: 14.kh, color: Colors.black),
        ),
        Text(
          'Popularity',
          style: TextStyleUtil.inter500(fontSize: 14.kh, color: Colors.black),
        ),
        Text(
          'Discount',
          style: TextStyleUtil.inter500(fontSize: 14.kh, color: Colors.black),
        ),
        Text(
          'Customer Rating',
          style: TextStyleUtil.inter500(fontSize: 14.kh, color: Colors.black),
        )
      ],
    ).paddingOnly(left: 32.kw),
  ));
}
