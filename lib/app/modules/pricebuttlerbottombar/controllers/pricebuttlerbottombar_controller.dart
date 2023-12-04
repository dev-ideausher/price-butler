import 'package:get/get.dart';

class PricebuttlerbottombarController extends GetxController
    with GetSingleTickerProviderStateMixin {
  //TODO: Implement PricebuttlerbottombarController
  var selectedPageIndex = 0.obs;

  changePage(int index) {
    selectedPageIndex.value = index;
  }

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
