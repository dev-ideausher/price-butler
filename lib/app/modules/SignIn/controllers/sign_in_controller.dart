import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../services/auth.dart';
import '../../../services/storage.dart';

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
    try {
      print("phone number: ${phoneNumber.value}");
      await Get.find<AuthService>()
          .mobileOtp(phoneno: '+91' + phoneNumber.value);
      print('encjtoken ${Get.find<GetStorageService>().encjwToken}');
      await Get.toNamed(
        Routes.LOGIN_OTP_AUTHENTICATION,
        arguments: phoneNumber.value,
      );
    } catch (e) {
      print('error: $e');
    }
  }
}
