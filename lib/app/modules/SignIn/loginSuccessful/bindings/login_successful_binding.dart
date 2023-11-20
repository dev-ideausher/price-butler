import 'package:get/get.dart';

import '../controllers/login_successful_controller.dart';

class LoginSuccessfulBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginSuccessfulController>(
      () => LoginSuccessfulController(),
    );
  }
}
