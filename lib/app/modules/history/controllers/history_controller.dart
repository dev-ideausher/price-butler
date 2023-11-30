import 'package:get/get.dart';

import '../../../constants/image_constant.dart';

class HistoryController extends GetxController {
  //TODO: Implement HistoryController
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
