import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper {
  static Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        //baseUrl: 'https://student.valuxapps.com/api/',
        baseUrl: 'http://10.0.2.2:8000/api/',
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
  }

  static Future<Response> getData({
    @required String url,
    // Map<String, dynamic> query,
    // @required Map<String, dynamic> data,
    String lang = 'ar',
    String token,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Authorization': token,
    };

    return await dio.get(
      url,
      // queryParameters: query,
      // data: data,
    );
  }

  static Future<Response> postData({
    @required String url,
    Map<String, dynamic> query,
    @required Map<String, dynamic> data,
    // String lang = 'ar',
    // String token,
  }) async {
    dio.options.headers = {
      // 'lang': lang,
      // 'Authorization': token,
    };

    return dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
