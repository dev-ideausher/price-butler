import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pricebutler/app/services/storage.dart';

import '../../../models/Categories.dart';
import '../../../models/subCategories.dart';
import '../../../services/dio/api_service.dart';

class CatogriesController extends GetxController {
  //TODO: Implement CatogriesController
  final SideMenuController sideMenuController = SideMenuController();
  Rxn<Categories> allCategories = Rxn<Categories>();
  Rxn<SubCategories> subCategories = Rxn<SubCategories>();
  final PageController pageController = PageController();
  final RxBool isSelected = false.obs;

  final RxInt currentIndex = 0.obs;
  RxList<String> electronicsDetailsList = <String>[].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    //changePage(currentIndex.value);
    await fetchCategories();
    await fetchsubCategories(
      allCategories.value!.data![0]!.Id.toString(),
    );
    print(Get.find<GetStorageService>().getEncjwToken);
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

  Future<void> fetchCategories() async {
    final response = await APIManager.getCategories();
    final dynamic responseData = response.data;
    final Map<String, dynamic> categoryData = responseData;
    allCategories.value = Categories.fromJson(categoryData);
  }

  Future<void> fetchsubCategories(String subCategoryId) async {
    final response = await APIManager.getsubCategories(subCategoryId);
    final dynamic responseData = response.data;
    subCategories.value = SubCategories.fromJson(responseData);
    if (subCategories.value != null && subCategories.value!.data != null) {
      electronicsDetailsList.assignAll(
        subCategories.value!.data!
            .map((subCategory) => subCategory?.name ?? '')
            .toList(),
      );
    }
  }
}
