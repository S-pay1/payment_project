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

import '../../../../../shared/global.dart';

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

    DioHelper.postData(
      url: LOGINs,
      data: {
        'phone': phone,
        'password': hashPassword.toString(),
        'typeOfUser': typeOfUser.toString()
      },
    ).then((value) {
      model = LoginModel.fromJson(value.data);
      loginotp(id: Gloablvar.id);
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

  void loginotp({
    String id,
    // String otp,
  }) {
    emit(loginloading());
    //id = RegisterCubit.get(context).model.data.id;
    DioHelper.postData(
      url: LoginOtp,
      data: {
        // 'otp_num': int.parse(otp),
        'client_id': Gloablvar.id,
      },
    ).then((value) {
      print(value.data);

      emit(loginOtpsuccess());
    }).catchError((error) {
      emit(loginOtperror());
      print(error.toString());
    });
  }
}
