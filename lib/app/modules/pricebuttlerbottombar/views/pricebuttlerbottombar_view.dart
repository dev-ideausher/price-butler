import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pricebutler/app/constants/image_constant.dart';
import 'package:pricebutler/app/modules/Home/views/home_view.dart';
import 'package:pricebutler/app/modules/catogries/views/catogries_view.dart';
import 'package:pricebutler/app/modules/compare/views/compare_view.dart';
import 'package:pricebutler/app/modules/pricebuttlerbottombar/controllers/pricebuttlerbottombar_controller.dart';
import 'package:pricebutler/app/modules/profile/views/profile_view.dart';
import 'package:pricebutler/app/services/colors.dart';

class PricebuttlerbottombarView
    extends GetView<PricebuttlerbottombarController> {
  final List<Widget> pages = [
    HomeView(),
    CatogriesView(),
    CompareView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.selectedPageIndex.value,
          onTap: (index) => controller.changePage(index),
          showUnselectedLabels: true,
          showSelectedLabels: true,
          unselectedItemColor: context.GreyNeutral,
          selectedItemColor: context.Green,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                ImageConstant.svghome,
                color: Colors.grey,
              ),
              activeIcon: SvgPicture.asset(
                ImageConstant.svghome,
                color: context.Green,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(ImageConstant.svgcategories),
              label: 'Categories',
              activeIcon: SvgPicture.asset(
                ImageConstant.svgcategories,
                color: context.Green,
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(ImageConstant.svgcompare),
              label: 'Compare',
              activeIcon: SvgPicture.asset(
                ImageConstant.svgcompare,
                color: context.Green,
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(ImageConstant.svgprofile),
              label: 'Profile',
              activeIcon: SvgPicture.asset(
                ImageConstant.svgprofile,
                color: context.Green,
              ),
            ),
          ],
        ),
      ),
      body: Obx(() => pages[controller.selectedPageIndex.value]),
    );
  }
}
