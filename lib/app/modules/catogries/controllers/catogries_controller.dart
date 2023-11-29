import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CatogriesController extends GetxController {
  //TODO: Implement CatogriesController
  final SideMenuController sideMenuController = SideMenuController();
  final PageController pageController = PageController();
  RxList<String> subcatogries = [
    'Smart Phone',
    'Cases And Covers',
    'Screen Protectors',
    'Charger And Cabels',
  ].obs;
  RxList<String> subcatogries1 = [
    'Microwaves',
    'Mixer And Grinders',
    'Screen Protectors',
    'Charger And Cabels',
  ].obs;
  final RxBool isSelected = false.obs;
  final RxInt currentIndex = 0.obs;
  @override
  void onInit() {
    super.onInit();
    //changePage(currentIndex.value);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  changePage(int index) {
    pageController.jumpToPage(index);
  }
}
