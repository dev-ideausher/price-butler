import 'package:get/get.dart';
import 'package:pricebutler/app/models/privacypolicy.dart';

import '../../../services/dio/api_service.dart';

class PrivacypolicyController extends GetxController {
  //TODO: Implement PrivacypolicyController
  Rxn<privacypolicy> allPrivacyPolicy = Rxn<privacypolicy>();
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    fetchPrivacyPolicy();
  }

  void increment() => count.value++;

  Future<void> fetchPrivacyPolicy() async {
    final response = await APIManager.getTermsAndCondition();
    final dynamic responseData = response.data;
    final Map<String, dynamic> categoryData = responseData;
    allPrivacyPolicy.value = privacypolicy.fromJson(categoryData);
  }
}
