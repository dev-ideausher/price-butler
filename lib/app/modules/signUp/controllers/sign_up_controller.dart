import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SignUpController extends GetxController {
  //TODO: Implement SignUpController
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  RxBool isTicked = false.obs;
  final phoneNumber = ''.obs;
  final name = ''.obs;

  // Add an action for handling the button press
  void handleButtonPress() {
    if (phoneNumber.isNotEmpty) {
      Get.toNamed(Routes.SIGN_UP_OTP_AUTHENTICATION,
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
}
