import 'package:get/get.dart';

import '../controllers/sign_up_success_ful_controller.dart';

class SignUpSuccessFulBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpSuccessFulController>(
      () => SignUpSuccessFulController(),
    );
  }
}
