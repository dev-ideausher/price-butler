import 'package:get/get.dart';
import 'package:pricebutler/app/services/auth.dart';

import '../../../../routes/app_pages.dart';
import '../../../../services/snackbar.dart';

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
      bool isStatus =
          await Get.find<AuthService>().verifyMobileOtp(otp: otp.value);
      if (isStatus) {
        Get.toNamed(Routes.LOGIN_SUCCESSFUL);
      } else {
        showMySnackbar(msg: "error saving user data");
      }
    } catch (e) {
      print('otp error: $e');
    }
  }
}
