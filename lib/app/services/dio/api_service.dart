import 'dart:convert';

import 'package:dio/dio.dart';

import 'client.dart';
import 'endpoints.dart';

class APIManager {
  ///Post API
  static Future<Response> postLoginOnboarding({required dynamic body}) async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true)
          .post(Endpoints.onBoarding, data: jsonEncode(body));
}
