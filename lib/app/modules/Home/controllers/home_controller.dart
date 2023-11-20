import 'package:get/get.dart';

import '../../../constants/image_constant.dart';

class HomeController extends GetxController {
  RxList<String> brandLogos = [
    ImageConstant.pngamazon,
    ImageConstant.pngwalmart,
    ImageConstant.pngebay,
    ImageConstant.pngbestbuy,
    ImageConstant.pngtarget,
  ].obs;

  RxList<String> productsList = [
    ImageConstant.pngmobilesandtablets,
    ImageConstant.pngappliances,
    ImageConstant.pngwatches,
    ImageConstant.pnglaptops,
    ImageConstant.pngperfumes,
    ImageConstant.pngmakeup,
  ].obs;
  RxList<String> productImage = [
    ImageConstant.pngmobilesandtablets,
    ImageConstant.pngappliances,
    ImageConstant.pngwatches,
    ImageConstant.pnglaptops,
    ImageConstant.pngperfumes,
    ImageConstant.pngmakeup,
  ].obs;
  RxList<String> productsName = [
    'Mobiles & Tablets',
    'Appliance',
    'Watches',
    'Laptops',
    'Perfumes',
    'Makeup',
  ].obs;
  RxList<String> productsNameList = [
    'Mobiles & Tablets',
    'Appliance',
    'Watches',
    'Laptops',
    'Perfumes',
    'Makeup',
  ].obs;
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
