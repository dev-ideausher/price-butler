import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../services/auth.dart';

class SignUpController extends GetxController {
  //TODO: Implement SignUpController
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  RxBool isTicked = false.obs;
  final phoneNumber = ''.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final RxString name = ''.obs;

  // Add an action for handling the button press

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

  sendOtp() async {
    try {
      print("phone number: ${phoneNumber.value}");
      await Get.find<AuthService>().mobileOtp(phoneno: phoneNumber.value);
      await Get.toNamed(
        Routes.SIGN_UP_OTP_AUTHENTICATION,
        arguments: {'phoneNumber': phoneNumber.value},
      );
    } catch (e) {
      print('error: $e');
    }
  }
}
