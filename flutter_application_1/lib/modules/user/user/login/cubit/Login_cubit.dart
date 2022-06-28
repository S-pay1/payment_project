// ignore_for_file: file_names, camel_case_types

import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';

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
      if (kDebugMode) {
        print(error.toString());
      }
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
  }) {
    emit(loginloading());

    DioHelper.postData(
      url: LoginOtp,
      data: {
        'client_id': Gloablvar.id,
      },
    ).then((value) {
      if (kDebugMode) {
        print(value.data);
      }

      emit(loginOtpsuccess());
    }).catchError((error) {
      emit(loginOtperror());
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
