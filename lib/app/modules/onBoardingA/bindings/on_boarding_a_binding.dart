import 'package:get/get.dart';

import '../controllers/on_boarding_a_controller.dart';

class OnBoardingABinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnBoardingAController>(
      () => OnBoardingAController(),
    );
  }
}
