import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pricebutler/app/services/auth.dart';

import '../../../routes/app_pages.dart';
import '../../../services/dio/api_service.dart';

class SignUpController extends GetxController {
  //TODO: Implement SignUpController
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  RxBool isTicked = false.obs;
  final phoneNumber = ''.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final RxString name = ''.obs;

  // Add an action for handling the button press
  Future<void> handleButtonPress() async {
    if (phoneNumber.isNotEmpty) {
      String enteredName = name.value;

      Map<String, dynamic> userData = {
        "name": enteredName,
      };

      await APIManager.postLoginOnboarding(body: userData).then((value) => {
            Get.find<AuthService>()
                .mobileOtp(phoneno: '+91' + phoneNumber.value),
            Get.toNamed(Routes.LOGIN_OTP_AUTHENTICATION)
          });
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
