import 'package:get/get.dart';
import 'package:pricebutler/app/services/auth.dart';

import '../../../../routes/app_pages.dart';

class LoginOtpAuthenticationController extends GetxController {
  //TODO: Implement LoginOtpAuthenticationController
  final otp = ''.obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  verifyOTP() async {
    try {
      await Get.find<AuthService>().verifyMobileOtp(otp: otp.value);
      await Get.toNamed(Routes.LOGIN_SUCCESSFUL);
    } catch (e) {
      print('Login otp error: $e');
    }
  }
}
