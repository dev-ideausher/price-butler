import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/image_constant.dart';

class WishlistController extends GetxController {
  PageController pageController = PageController();
  SideMenuController sideMenu = SideMenuController();
  RxList<RxBool> itemSelectedStates = List.generate(10, (_) => false.obs).obs;
  RxList<double> sliderValues = [0.00, 0.00].obs;
  RxBool selectAll = false.obs;
  final RxInt currentIndex = 0.obs;
  RxList<String> dummyList =
      ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'].obs;
  RxBool checkboxValue1 = true.obs;
  RxList<String> productsList = [
    ImageConstant.pngmobilesandtablets,
    ImageConstant.pngappliances,
    ImageConstant.pngwatches,
    ImageConstant.pnglaptops,
    ImageConstant.pngperfumes,
    ImageConstant.pngmakeup,
  ].obs;
  RxList<String> availableStores = [
    ImageConstant.pngamazon,
    ImageConstant.pngwalmart,
  ].obs;
  RxList<String> productsDescription = [
    '64GB Memory & lpre...',
    '64GB Memory & lpre...',
    '64GB Memory & lpre...',
    '64GB Memory & lpre...',
    '64GB Memory & lpre...',
    '64GB Memory & lpre...',
  ].obs;
  RxList<String> productsName = [
    'IPhone 15 Pro',
    'IPhone 15 Pro',
    'IPhone 15 Pro',
    'IPhone 15 Pro',
    'IPhone 15 Pro',
    'IPhone 15 Pro',
  ].obs;
  RxList<String> productsCurrentPrice = [
    '399',
    '499',
    '299',
    '599',
    '199',
    '599',
  ].obs;
  RxList<String> productsLastPrice = [
    '699',
    '599',
    '799',
    '899',
    '499',
    '699',
  ].obs;
  RxList<String> productRating = [
    '4.9',
    '4.2',
    '4.2',
    '4.2',
    '4.2',
    '4.2',
  ].obs;
  RxList<String> productTotalReview =
      ['(123)', '(123)', '(123)', '(123)', '(123)', '(123)'].obs;
  TextEditingController searchController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    sideMenu.addListener((index) {
      pageController.jumpToPage(index);
      //searchController;
    });
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  changePage(int index) {
    pageController.jumpToPage(index);
  }

  changeItemSelectedState(int index) {
    itemSelectedStates[index].value = !itemSelectedStates[index].value;
    print(index);
    update();
  }

  void onDragging(int handlerIndex, double lowerValue, double upperValue) {
    sliderValues[0] = lowerValue;
    sliderValues[1] = upperValue;
  }
}
