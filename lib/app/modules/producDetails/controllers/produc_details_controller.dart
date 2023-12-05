import 'package:flutter_bullet_list/flutter_bullet_list.dart';
import 'package:get/get.dart';
import 'package:pricebutler/app/constants/image_constant.dart';

class ProducDetailsController extends GetxController {
  //TODO: Implement ProducDetailsController
  final RxList<String?> storesName = ['Amazon', 'Best Buy', 'Walmart'].obs;
  final RxList<String?> reviewStars = ['1', '2', '3', '4', '5'].obs;
  final RxList<String?> reviewerName = [
    'Riyan Sam',
    'Riyan Sam',
  ].obs;
  final RxList<num> reviewProgress = [0.3, 0.2, 0.3, 0.4, 1].obs;
  final RxList<String?> totalReviewCount = ['77', '30', '55', '10', '20'].obs;
  final RxList<String?> storesIcon = [
    ImageConstant.pngamazon,
    ImageConstant.pngbestbuy,
    ImageConstant.pngwalmart
  ].obs;
  final RxList<String?> productPrice = ['\$299', '\$199', '\$599'].obs;
  final RxList<ListItemModel>? data = [
    ListItemModel(label: "Bluetooth 5.0, Gps, Nfc"),
    ListItemModel(label: "1 GB Ram, 32 GB Inbuilt"),
    ListItemModel(label: "1.78 inches Touch Display"),
    ListItemModel(label: "Water Resistant, 50m, IP68"),
    ListItemModel(label: "Scratch Resistant"),
    ListItemModel(label: "Heart Rate Monitor"),
    ListItemModel(label: "SpO2 Blood Oxygen Monitor"),
    ListItemModel(label: "Sleep Monitor, Calorie Count, Step Count"),
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
  final RxList<Map<dynamic, dynamic>> compareList =
      <Map<dynamic, dynamic>>[].obs;
  void addToCompareList(Map<dynamic, dynamic> arguments) {
    compareList.add(arguments);
  }

  @override
  void onInit() {
    super.onInit();
    //compareList.clear();
    print('compare list: $compareList');
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    //compareList.clear();
  }

  void increment() => count.value++;
}
