import 'package:get/get.dart';

import '../controllers/catogries_controller.dart';

class CatogriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CatogriesController>(
      () => CatogriesController(),
    );
  }
}
