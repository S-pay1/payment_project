// ignore_for_file: avoid_print
import 'dart:io';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:pointycastle/asymmetric/api.dart';

import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';
import 'package:encrypt/encrypt_io.dart';

import 'package:flutter/material.dart';

import 'package:flutter_application_1/models/user_model/login_model.dart';
import 'package:flutter_application_1/shared/dio/dio_helper.dart';
import 'package:flutter_application_1/shared/dio/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'Login_state.dart';

class loginCubit extends Cubit<loginState> {
  loginCubit() : super(loginInitial());
  static loginCubit get(context) => BlocProvider.of(context);

  LoginModel model;
  void userlogin({
    @required String phone,
    @required String password,
    @required String typeOfUser,
  }) async {
    var pas = utf8.encode(password);
    var hashPassword = sha256.convert(pas);
    typeOfUser = 'user';
    emit(loginloading());
    var data = {
      'phone': phone,
      'password': hashPassword.toString(),
      'typeOfUser': typeOfUser.toString()
    };
    var key = await rsaEncrypt(jsonEncode(data));
    print(key.toString());
    DioHelper.postData(
      url: LOGINs,
      data: {
        // 'phone': phone,
        // 'password': hashPassword.toString(),
        // 'type': 'user',
        'key': key
        // 'typeOfUser': typeOfUser.toString()
      },
    ).then((value) {
      model = LoginModel.fromJson(value.data);

      emit(loginsuccess(model));
    }).catchError((error) {
      emit(loginerror(error.toString()));
      print(error.toString());
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(loginpaswwordChange());
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
