import 'package:get/get.dart';

import '../../../constants/image_constant.dart';

class CompareController extends GetxController {
  //TODO: Implement CompareController
  RxList<String> productImage = [
    ImageConstant.pngmobilesandtablets,
    ImageConstant.pngappliances,
  ].obs;
  RxList<String> productsNameList = [
    'Apple Watch SE 2nd Gen 44mm (GPS + Cellular)',
    'Appliance',
    'Appliance',
    'Appliance',
  ].obs;
  RxList<String> productsDescription = [
    '64GB Memory & lpre...',
    '64GB Memory & lpre...',
  ].obs;
  RxList<String> productsCurrentPrice = [
    '399',
    '499',
  ].obs;
  RxList<String> productsLastPrice = [
    '699',
    '599',
  ].obs;
  RxList<String> productRating = [
    '4.9',
    '4.2',
  ].obs;
  RxList<String> productTotalReview = [
    '(123)',
    '(123)',
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
