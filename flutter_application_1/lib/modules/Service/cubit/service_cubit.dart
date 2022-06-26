// ignore_for_file: non_constant_identifier_names, unused_local_variable, unused_element, avoid_print, void_checks

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:pointycastle/asymmetric/api.dart';
import 'package:encrypt/encrypt.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/models/service_model/service_model.dart';
import 'package:flutter_application_1/shared/dio/dio_helper.dart';
import 'package:flutter_application_1/shared/dio/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/service_model/get_service_model.dart';
import '../../../shared/global.dart';

part 'service_state.dart';

class ServiceCubit extends Cubit<ServiceState> {
  ServiceCubit() : super(ServiceInitial());
  static ServiceCubit get(context) => BlocProvider.of(context);
  int counterIndex;

  List<String> ChosseService = [
    'gas',
    'water',
    'Electronic',
    'phone',
    'landing',
    'wifi',
    'other services',
  ];
  List<String> Servicecode = [
    'Service code',
    'Service code',
    'Service code',
    'phone number',
    'landing number',
    'number',
    'opreation number',
  ];
  List<String> ServicCompany = [
    'company',
    'company',
    'company',
    'Network',
    'landing number',
    'number',
    'company',
  ];
  List<String> PinServic = [
    'PIN',
    'PIN',
    'PIN',
  ];
  int indexOfServices;

  void changeindexscreen(text) {
    Global.indexOfServices = ChosseService.indexOf(text);
    // Global.indexOfServices = Servicecode.indexOf(text);
    // Global.indexOfServices = ServicCompany.indexOf(text);
    print(Global.indexOfServices);
  }

  ServiceModel model;
  Future<void> userService({
    String client_id,
    String company_name,
    @required double price,
    @required String service_code,
    String pin,
  }) async {
    emit(Serviceloading());
    var feeds = price * (0.02);

    DioHelper.postData(
      url: Payment_data,
      data: {
        'client_id': Gloablvar.id,
        'company_name': company_name,
        'price': price,
        'service_code': service_code,
        'feeds': feeds,
        'pin': pin,
      },
    ).then((value) {
      model = ServiceModel.fromJson(value.data);

      Gloablvar.feeds = model.data.feeds;
      Gloablvar.price = model.data.price;
      Gloablvar.service_code = model.data.service_code;
      Gloablvar.total = model.data.total;
      Gloablvar.date = model.data.date;

      emit(Servicesuccess(model));
    }).catchError((error) {
      emit(Serviceerror(error.toString()));
      print(error.toString());
    });
  }

  Future<void> RSApaymet({
    String client_id,
    String company_name,
    @required double price,
    @required String service_code,
    String pin,
  }) async {
    emit(Serviceloading());
    var feeds = price * (0.02);
    var data = {
      'client_id': Gloablvar.id,
      'company_name': company_name,
      'price': price,
      'service_code': service_code,
      'feeds': feeds,
      'pin': pin,
    };

    var key = await rsaEncrypt(jsonEncode(data));
    print(key.toString());
    DioHelper.postData(
      url: Payment,
      data: {'key': key},
    ).then((value) {
      model = ServiceModel.fromJson(value.data);

      Gloablvar.feeds = model.data.feeds;
      Gloablvar.price = model.data.price;
      Gloablvar.service_code = model.data.service_code;
      Gloablvar.total = model.data.total;
      Gloablvar.date = model.data.date;

      //print(model.data.token);
      print(value.data);
      print(model.message);

      emit(Servicesuccess(model));
    }).catchError((error) {
      emit(Serviceerror(error.toString()));
      // print(error.toString());
    });
  }

  DataModel Companymodel;
  void companyData(text) {
    Gloablvar.itemsOfDropDown = [];
    emit(ServiceGetloading());
    print(text);
    DioHelper.getData(url: getserve, query: {
      'service': text,
    }).then((value) {
      Companymodel = DataModel.fromJson(value.data);
      for (var element in Companymodel.data.companies) {
        Gloablvar.itemsOfDropDown.add(element.name);
      }

      print(value.data);
      print(Gloablvar.itemsOfDropDown);

      emit(ServiceGetsuccess(Companymodel));
    }).catchError((error) {
      print('catch error');
      emit(ServiceGeterror(error.toString()));
      print(error.toString());
    });
    return;
  }

  dynamic rsaEncrypt(data) async {
    // final publicKey =
    //     await parseKeyFromFile<RSAPublicKey>('assets/publicKey.pem');
    // final privKey =
    //     await parseKeyFromFile<RSAPrivateKey>('assets/privateKey.pem');
    final publicPem = await rootBundle.loadString('assets/publicKey.pem');
    final publicKey = RSAKeyParser().parse(publicPem) as RSAPublicKey;
    final privPem = await rootBundle.loadString('assets/privateKey.pem');
    final privKey = RSAKeyParser().parse(privPem) as RSAPrivateKey;

    final encrypter = Encrypter(RSA(
      publicKey: publicKey,
      privateKey: privKey,
    ));
    var test =
        'gwjFS7kNPIe9qdi8C/G2US/FvGFGcJCDfcdE6L7STYRrDHcZuw326a+FbJYbkcKdvEggULe0wma37j+aMVo5PzqjRfP8CsKYm14ZUL6JQlYHZCJCv57eJtHi2igNiGxpPMry/fp+9keCAJ4srDqyXRHj9dqw/6MRa1v5wZUXIUh/Q685e2KrD5ZAKv/UP8BKa9bRRepDU+2tvTnIFdBpN2FZyG2LoY4IzfGiWCyYoyW5cK1gCzPbjHPgO7tieyy/P/Csz94KryiYGSljvoJDhNyRjLRCT8gwTuMO5Z4AKW3pD2s34yFloZb1dc1teFdf6H2Ue4k6YhghluyiIPYUxKHIUnAqowcGT4Q3ngLtsv6Uzw3mUe5jnXyRZ6tKfPfKQDfh0jtisdiNZBPbt7kWMuKLNvlmhgnya27DOxa3qwxlH9SV4amW5/6TB5XQI4MF6Mf1HvaQmOOeVxRxd0RR/PY88YpyctjubavI33+D7e/9gQw7kLzzNMrPsvDYy1miv2Lo3rzDJZEJnBvW1cE56m2Ot/G1ay3xNhB9JsTE4AjqLgrBdGN3GwbAvNjop1vFtJK0QGC+5I6piy0cAgp979OsqNbZDFmMp0PqcNTdjWOlbUUJdiTO98AA770hZ0v31353xQ0pplDOydw8Ru46HysfiRzgs/muIB9qOiDPdXg=';
    final encrypted = encrypter.encrypt(data.toString());
    final decrypted = encrypter.decrypt(encrypted);

    print(decrypted); // Lorem ipsum dolor sit amet, consectetur adipiscing elit
    return await encrypted.base64;
  }
}
