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
  RxList<String> productType = [
    'Mobiles & Tablets',
    'Appliance',
    'Watches',
    'Laptops',
    'Perfumes',
    'Makeup',
  ].obs;
  RxList<String> productsNameList = [
    'Apple Watch SE 2nd Gen 44mm (GPS + Cellular)',
    'Appliance',
    'Watches',
    'Laptops',
    'Perfumes',
    'Makeup',
  ].obs;
  RxList<String> productsDescription = [
    '64GB Memory & lpre...',
    '64GB Memory & lpre...',
    '64GB Memory & lpre...',
    '64GB Memory & lpre...',
    '64GB Memory & lpre...',
    '64GB Memory & lpre...',
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
