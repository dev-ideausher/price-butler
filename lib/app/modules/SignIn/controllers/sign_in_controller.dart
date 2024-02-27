import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../services/auth.dart';

class SignInController extends GetxController {
  //TODO: Implement SignInController

  final count = 0.obs;
  final TextEditingController phoneNumberController = TextEditingController();
  final phoneNumber = ''.obs;

  void handleButtonPress() {
    sendOtp();
  }

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

  sendOtp() async {
    print("phone number: ${phoneNumber.value}");
    await Get.find<AuthService>().mobileOtp(phoneno: phoneNumber.value);
    await Get.toNamed(
      Routes.LOGIN_OTP_AUTHENTICATION,
      arguments: {'phoneNumber': phoneNumber.value},
    );
  }
}
