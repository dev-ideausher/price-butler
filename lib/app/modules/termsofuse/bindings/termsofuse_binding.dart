import 'package:get/get.dart';

import '../controllers/termsofuse_controller.dart';

class TermsofuseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TermsofuseController>(
      () => TermsofuseController(),
    );
  }
}
