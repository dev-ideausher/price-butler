import 'package:get/get.dart';

import '../controllers/login_otp_authentication_controller.dart';

class LoginOtpAuthenticationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginOtpAuthenticationController>(
      () => LoginOtpAuthenticationController(),
    );
  }
}
