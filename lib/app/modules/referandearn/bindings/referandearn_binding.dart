import 'package:get/get.dart';

import '../controllers/referandearn_controller.dart';

class ReferandearnBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReferandearnController>(
      () => ReferandearnController(),
    );
  }
}
