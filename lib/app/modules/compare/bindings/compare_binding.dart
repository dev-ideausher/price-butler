import 'package:get/get.dart';

import '../controllers/compare_controller.dart';

class CompareBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompareController>(
      () => CompareController(),
    );
  }
}
