import 'package:get/get.dart';
import 'package:pricebutler/app/constants/image_constant.dart';
import 'package:pricebutler/app/routes/app_pages.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController

  final count = 0.obs;
  RxList<String> profileMenuButton = [
    Routes.PRICE_ALERT,
    Routes.REFERANDEARN,
    Routes.FAQ,
    Routes.SETTINGS,
  ].obs;
  RxList<String> profileMenuIcon = [
    ImageConstant.svgnotificationline,
    ImageConstant.svgwallet,
    ImageConstant.svgfaq,
    ImageConstant.svgsettings
  ].obs;
  RxList<String> menuTitle = [
    'Price Alert',
    'Earn & Redeem',
    'FAQ’s',
    'Settings',
  ].obs;
  RxList<String> titleDescription = [
    'Get automated notifications when price drop',
    'Refer Friends, view prizes and earn rewards',
    'All frequently asked questions',
    'Manage notificationss',
  ].obs;
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
