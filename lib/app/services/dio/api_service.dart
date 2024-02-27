import 'dart:convert';

import 'package:dio/dio.dart';

import 'client.dart';
import 'endpoints.dart';

class APIManager {
  ///Post API
  static Future<Response> postLoginOnboarding({required dynamic body}) async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: false)
          .post(Endpoints.onBoarding, data: jsonEncode(body));

  static Future<Response> getCategories() async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: false)
          .get(Endpoints.userUrl + Endpoints.categories);

  static Future<Response> getsubCategories(String subCategoriesID) async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: false).get(
          Endpoints.subCategoriesUrl +
              Endpoints.subCategories +
              subCategoriesID);
  static Future<Response> getFAQLIST() async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: false)
          .get(Endpoints.userUrl + Endpoints.faqList);
  static Future<Response> getPrivacyPolicy() async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: false)
          .get(Endpoints.userUrl + Endpoints.privacyPolicy);
  static Future<Response> getTermsAndCondition() async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: false)
          .get(Endpoints.userUrl + Endpoints.termsandcondition);
}
//65b7783f503d2e949a166277
