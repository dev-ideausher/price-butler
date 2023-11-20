import 'package:get/get.dart';

import '../controllers/sign_up_otp_authentication_controller.dart';

class SignUpOtpAuthenticationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpOtpAuthenticationController>(
      () => SignUpOtpAuthenticationController(),
    );
  }
}
