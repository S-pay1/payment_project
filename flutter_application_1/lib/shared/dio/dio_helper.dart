import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper {
  static Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        //baseUrl: 'https://student.valuxapps.com/api/',
        baseUrl: 'http://10.0.2.2:8000/',

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
      {@required String url,
      // Map<String, dynamic> query,
      Map<String, dynamic> query
      // String lang = 'ar',
      // String token,
      }) async {
    dio.options.headers = {
      // 'lang': lang,
      // 'Authorization': token,
    };

    return await dio.get(
      url,
      queryParameters: query,
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

  static Future<Response> PutData({
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
      print(response.data.toString());
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
