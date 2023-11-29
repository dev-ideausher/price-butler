import 'package:get/get.dart';

import '../controllers/produc_details_controller.dart';

class ProducDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProducDetailsController>(
      () => ProducDetailsController(),
    );
  }
}
