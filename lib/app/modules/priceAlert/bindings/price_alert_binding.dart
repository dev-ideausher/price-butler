import 'package:get/get.dart';

import '../controllers/price_alert_controller.dart';

class PriceAlertBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PriceAlertController>(
      () => PriceAlertController(),
    );
  }
}
