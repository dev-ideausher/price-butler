import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pricebutler/app/components/PriceButtleAppBar.dart';
import 'package:pricebutler/app/components/common_image_view.dart';
import 'package:pricebutler/app/constants/image_constant.dart';
import 'package:pricebutler/app/services/colors.dart';
import 'package:pricebutler/app/services/responsive_size.dart';
import 'package:pricebutler/app/services/text_style_util.dart';

import '../controllers/catogries_controller.dart';

class CatogriesView extends GetView<CatogriesController> {
  const CatogriesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CatogriesController());
    return Scaffold(
      appBar: PriceButtlerAppBar(
        elevation: 0,
        title: Text(
          'Categories',
          style: TextStyleUtil.inter500(fontSize: 20.kh, color: Colors.black),
        ),
      ),
      body: Obx(
        () => Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            NavigationRail(
              selectedIndex: controller.currentIndex.value,
              indicatorColor: Colors.red,
              unselectedLabelTextStyle:
                  TextStyleUtil.inter400(fontSize: 10, color: Colors.black),
              selectedLabelTextStyle:
                  TextStyleUtil.inter400(fontSize: 10, color: context.Green),
              backgroundColor: const Color(0xFFEFF1F4),
              onDestinationSelected: (int index) {
                controller.currentIndex.value = index;
                controller.changePage(index);
              },
              destinations: <NavigationRailDestination>[
                NavigationRailDestination(
                    icon: unselectedIcon(
                      imagePath: ImageConstant.pngelectronics,
                      label: 'Electronics',
                    ),
                    selectedIcon: selectedIcon(
                      imagePath: ImageConstant.pngelectronics,
                      label: 'Electronics',
                    ),
                    label: const SizedBox()),
                NavigationRailDestination(
                  icon: unselectedIcon(
                    imagePath: ImageConstant.pnghomeAppliance,
                    label: 'Home Appliances',
                  ),
                  selectedIcon: selectedIcon(
                    imagePath: ImageConstant.pnghomeAppliance,
                    label: 'Home Appliances',
                  ),
                  label: const SizedBox(),
                ),
                NavigationRailDestination(
                  icon: unselectedIcon(
                    imagePath: ImageConstant.pngfashion,
                    label: 'Fashion',
                  ),
                  selectedIcon: selectedIcon(
                    imagePath: ImageConstant.pngfashion,
                    label: 'Fashion',
                  ),
                  label: const SizedBox(),
                ),
                NavigationRailDestination(
                  icon: unselectedIcon(
                    imagePath: ImageConstant.pnghomeAppliance,
                    label: 'Beauty & Personal Care',
                  ),
                  selectedIcon: selectedIcon(
                    imagePath: ImageConstant.pnghomeAppliance,
                    label: 'Beauty & Personal Care',
                  ),
                  label: const SizedBox(),
                ),
                NavigationRailDestination(
                  icon: unselectedIcon(
                    imagePath: ImageConstant.pngbook,
                    label: 'Books and Media',
                  ),
                  selectedIcon: selectedIcon(
                    imagePath: ImageConstant.pngbook,
                    label: 'Books and Media',
                  ),
                  label: const SizedBox(),
                ),
              ],
              labelType: NavigationRailLabelType.values[2],
            ),
            Expanded(
              child: PageView(
                controller: controller.pageController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  SingleChildScrollView(
                    child: electronicsDetails(
                      subcategories: controller.subcatogries,
                      itemCount: controller.subcatogries.length,
                    ),
                  ),
                  SingleChildScrollView(
                    child: homeAppliance(
                        subcategories1: controller.subcatogries1,
                        itemCount: controller.subcatogries1.length),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class electronicsDetails extends StatelessWidget {
  final List<String> subcategories;
  final int itemCount;
  const electronicsDetails({
    super.key,
    required this.subcategories,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CatogriesController());
    return Column(
      children: [
        ExpansionTile(
          title: Text(
            'Mobile Phones & Accessories',
            style: TextStyleUtil.inter500(fontSize: 14.kh, color: Colors.black),
          ),
          //backgroundColor: Colors.red,
          children: [
            Container(
                color: const Color(0xFFEFF1F4),
                child: ListView.builder(
                    itemCount: itemCount,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Text(
                        subcategories[index],
                        style: TextStyleUtil.inter400(
                            fontSize: 14.kh, color: context.GreyNeutral),
                      ).paddingSymmetric(vertical: 16.kh, horizontal: 12.kw);
                    })).paddingOnly(left: 19.kw, right: 24.kw),
          ],
        ),
        ExpansionTile(
          title: Text(
            'Computers & Accessories',
            style: TextStyleUtil.inter500(fontSize: 14.kh, color: Colors.black),
          ),
          //backgroundColor: Colors.red,
          children: [
            Container(
                color: const Color(0xFFEFF1F4),
                child: ListView.builder(
                    itemCount: itemCount,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Text(
                        subcategories[index],
                        style: TextStyleUtil.inter400(
                            fontSize: 14.kh, color: context.GreyNeutral),
                      ).paddingSymmetric(vertical: 16.kh, horizontal: 12.kw);
                    })).paddingOnly(left: 19.kw, right: 24.kw),
          ],
        ),
        ExpansionTile(
          title: Text(
            'Audio And Video',
            style: TextStyleUtil.inter500(fontSize: 14.kh, color: Colors.black),
          ),
          //backgroundColor: Colors.red,
          children: [
            Container(
                color: const Color(0xFFEFF1F4),
                child: ListView.builder(
                    itemCount: itemCount,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Text(
                        subcategories[index],
                        style: TextStyleUtil.inter400(
                            fontSize: 14.kh, color: context.GreyNeutral),
                      ).paddingSymmetric(vertical: 16.kh, horizontal: 12.kw);
                    })).paddingOnly(left: 19.kw, right: 24.kw),
          ],
        ),
      ],
    );
  }
}

class homeAppliance extends StatelessWidget {
  final List<String> subcategories1;
  final int itemCount;
  const homeAppliance({
    super.key,
    required this.subcategories1,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CatogriesController());
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ExpansionTile(
          title: Text(
            'Homes Appliances',
            style: TextStyleUtil.inter500(fontSize: 14.kh, color: Colors.black),
          ),
          //backgroundColor: Colors.red,
          children: [
            Container(
                color: const Color(0xFFEFF1F4),
                child: ListView.builder(
                    itemCount: itemCount,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Text(subcategories1[index])
                          .paddingSymmetric(vertical: 16.kh, horizontal: 12.kw);
                    })).paddingOnly(left: 19.kw, right: 24.kw),
          ],
        ),
      ],
    );
  }
}

class selectedIcon extends StatelessWidget {
  final String? imagePath;
  final String? label;
  const selectedIcon({
    super.key,
    this.imagePath,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 120.kw,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8.kw)),
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(color: Color(0xff0ffeefffa)),
                child: CommonImageView(
                  imagePath: imagePath,
                ).paddingAll(10.kh),
              ).paddingOnly(bottom: 6.kh),
              Text(label!,
                  textAlign: TextAlign.center,
                  style: TextStyleUtil.inter400(
                      fontSize: 14.kh, color: context.Green)),
            ],
          ).paddingOnly(right: 16.kw, left: 16.kw, top: 16.kh, bottom: 16.kh),
        ),
        Container(
          width: 80,
          height: 1,
          color: context.oneStarColor,
        )
      ],
    );
  }
}

class unselectedIcon extends StatelessWidget {
  final String? imagePath;
  final String? label;
  const unselectedIcon({
    super.key,
    this.imagePath,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.kw,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8.kw)),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: const Color(0xFFF2F2F2),
                borderRadius: BorderRadius.circular(8.kw)),
            child: CommonImageView(
              imagePath: imagePath,
            ).paddingAll(10.kh),
          ).paddingOnly(bottom: 6.kh),
          Text(label!,
              textAlign: TextAlign.center,
              style:
                  TextStyleUtil.inter400(fontSize: 14.kh, color: Colors.black))
        ],
      ).paddingOnly(right: 16.kw, left: 16.kw, top: 16.kh, bottom: 16.kh),
    );
  }
}
