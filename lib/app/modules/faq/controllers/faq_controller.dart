import 'package:get/get.dart';
import 'package:pricebutler/app/services/storage.dart';

import '../../../models/faq.dart';
import '../../../services/dio/api_service.dart';

class FaqController extends GetxController {
  RxList<String> faqQuestionList = [
    'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters',
    'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters',
    'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters'
  ].obs;
  Rxn<faq> allfaq = Rxn<faq>();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    fetchFaq();
    print(Get.find<GetStorageService>().getEncjwToken);
  }

  @override
  void onClose() {}

  Future<void> fetchFaq() async {
    final response = await APIManager.getFAQLIST();
    final dynamic responseData = response.data;
    final Map<String, dynamic> categoryData = responseData;
    allfaq.value = faq.fromJson(categoryData);
    print(allfaq.value!.data![0]!.categoryName);
  }
}
