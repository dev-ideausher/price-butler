import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../services/auth.dart';
import '../../../services/dio/api_service.dart';

class SignUpOtpAuthenticationController extends GetxController {
  //TODO: Implement SignUpOtpAuthenticationController
  Map<String, dynamic> arguments = Get.arguments;
  String enteredName = Get.arguments['name'].toString();
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

  Future<void> handleButtonPress() async {
    //print('name ${enteredName}');
    print('phone:::: ${enteredName}');
    Map<String, dynamic> userData = {
      "name": enteredName,
    };

    await APIManager.postLoginOnboarding(body: userData).then((value) => {
          Get.find<AuthService>().verifyMobileOtp(otp: otp.value),
          Get.toNamed(Routes.SIGN_UP_SUCCESS_FUL)
        });
  }

  verifyOTP() async {
    try {
      await Get.find<AuthService>().verifyMobileOtp(otp: otp.value);
      handleButtonPress();
      Get.toNamed(Routes.SIGN_UP_SUCCESS_FUL);
    } catch (e) {
      print('otp error in signUp Controller:: $e');
    }
  }
}
