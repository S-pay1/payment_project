// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioHelper {
  static Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://3.131.228.191/',
        receiveDataWhenStatusError: true,
        followRedirects: false,
        validateStatus: (status) {
          return status < 500;
        },
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
  }

  static Future<Response> getData(
      {@required String url, Map<String, dynamic> query}) async {
    dio.options.headers = {};

    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    @required String url,
    Map<String, dynamic> query,
    @required Map<String, dynamic> data,
  }) async {
    dio.options.headers = {};

    return dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> PutData({
    @required String url,
    Map<String, dynamic> query,
    @required Map<String, dynamic> data,
  }) async {
    dio.options.headers = {};

    return dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }

  Future<List<dynamic>> getTheHistory() async {
    try {
      Response response =
          await dio.get(BaseOptions().baseUrl + 'clients/{id}/payments');
      if (kDebugMode) {
        print(response.data.toString());
      }
      return response.data;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return [];
    }
  }
}
