import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/shared/dio/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'pasword_state.dart';

class passwordCubit extends Cubit<passwordState> {
  passwordCubit() : super(passwordInitial());
  static passwordCubit get(context) => BlocProvider.of(context);

  void userpassword({
    @required String phone,
    @required String password,
    @required String typeOfUser,
  }) {
    var pas = utf8.encode(password);
    var hashPassword = sha256.convert(pas);
    typeOfUser = 'user';
    emit(passwordloading());
    DioHelper.postData(
      // url: passwords,
      data: {
        'phone': phone,
        'password': hashPassword.toString(),
        'type': 'user',
        'typeOfUser': typeOfUser.toString()
      },
    ).then((value) {
      // model = passwordModel.fromJson(value.data);
      // print(model.status);
      // print(model.message);
      //print(model.data.token);
      print(value.data);

      // emit(passwordsuccess(model));
    }).catchError((error) {
      emit(passworderror(error.toString()));
      print(error.toString());
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(passwordpaswwordChange());
  }
}
