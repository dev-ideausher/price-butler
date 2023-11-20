import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SignInController extends GetxController {
  //TODO: Implement SignInController

  final count = 0.obs;
  final TextEditingController phoneNumberController = TextEditingController();
  final phoneNumber = ''.obs;

  // Add an action for handling the button press
  void handleButtonPress() {
    if (phoneNumber.isNotEmpty) {
      Get.toNamed(Routes.LOGIN_OTP_AUTHENTICATION,
          arguments: phoneNumber.value);
    }
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
}
