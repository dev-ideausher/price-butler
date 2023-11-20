import 'package:get/get.dart';

import '../controllers/pricebuttlerbottombar_controller.dart';

class PricebuttlerbottombarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PricebuttlerbottombarController>(
      () => PricebuttlerbottombarController(),
    );
  }
}
