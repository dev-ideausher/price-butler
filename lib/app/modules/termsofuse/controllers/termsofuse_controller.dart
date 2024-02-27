import 'package:get/get.dart';
import 'package:pricebutler/app/models/termsandconditions.dart';

import '../../../services/dio/api_service.dart';

class TermsofuseController extends GetxController {
  //TODO: Implement TermsofuseController

  final count = 0.obs;
  Rxn<TermsANdCondition> termsandcondition = Rxn<TermsANdCondition>();
  @override
  void onInit() {
    super.onInit();
    fetchTermsAndContion();
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
  Future<void> fetchTermsAndContion() async {
    final response = await APIManager.getPrivacyPolicy();
    final dynamic responseData = response.data;
    final Map<String, dynamic> categoryData = responseData;
    termsandcondition.value = TermsANdCondition.fromJson(categoryData);
  }
}
