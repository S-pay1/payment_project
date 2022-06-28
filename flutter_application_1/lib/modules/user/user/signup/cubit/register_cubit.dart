// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_1/models/user_model/register_model.dart';

import 'package:flutter_application_1/shared/dio/dio_helper.dart';
import 'package:flutter_application_1/shared/dio/end_points.dart';
import 'package:flutter_application_1/shared/global.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:uuid/uuid.dart';

import '../../../../../models/reset_model/reset_model.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);

  RegisterModel model;
  void userRegister({
    String name,
    String phone,
    String password,
    String salt,
    String typeOfUser,
    String Email,
  }) {
    var uuid = Uuid();
    var salt = uuid.v4();
    var pas = utf8.encode(password);
    var hashPassword = sha256.convert(pas);

    var newSalt = salt.replaceAll("-", "");
    typeOfUser = 'user';

    emit(Registerloading());

    DioHelper.postData(
      url: REIGSTERs,
      data: {
        'password': hashPassword.toString() + newSalt,
        'phone': phone,
        'name': name,
        'salt': newSalt,
        'typeOfUser': typeOfUser.toString(),
        'email': Email
      },
    ).then((value) {
      model = RegisterModel.fromJson(value.data);
      Gloablvar.id = model.data.id;
      if (kDebugMode) {
        print(model.data.id + 'id');
      }
      if (kDebugMode) {
        print(model.status);
      }
      if (kDebugMode) {
        print(model.message);
      }

      if (kDebugMode) {
        print(value.data);
      }

      emit(Registersuccess(model));
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(Registererror(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(RegisterpaswwordChange());
  }

  ResetModel remodel;
  void SendOtp({
    String email,
  }) {
    emit(Registerloading());
    DioHelper.postData(
      url: cheakuser,
      data: {
        'email': email,
      },
    ).then((value) {
      remodel = ResetModel.fromJson(value.data);
      Gloablvar.resetpasswordScreen = true;
      Gloablvar.Email = email;

      if (kDebugMode) {
        print(remodel.message);
      }

      if (kDebugMode) {
        print(value.data);
      }
      emit(Checksuccess(remodel));
    }).catchError((error) {
      emit(Checkererror(error.toString()));
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  void userRegisterGenerate({
    String name,
    String phone,
    String password,
    String salt,
    String typeOfUser,
    String email,
  }) {
    var uuid = Uuid();
    var salt = uuid.v4();
    var pas = utf8.encode(Gloablvar.passwordgenerate);
    var hashPassword = sha256.convert(pas);
    var newSalt = salt.replaceAll("-", "");
    typeOfUser = 'user';

    emit(Registerloading());
    var data = {
      'password': hashPassword.toString() + newSalt,
      'phone': Gloablvar.phone,
      'name': Gloablvar.name,
      'salt': newSalt,
      'typeOfUser': typeOfUser.toString(),
      'email': Gloablvar.Email
    };
    if (kDebugMode) {
      print(data);
    }
    DioHelper.postData(
      url: REIGSTERs,
      data: {
        'password': hashPassword.toString() + newSalt,
        'phone': Gloablvar.phone,
        'name': Gloablvar.name,
        'salt': newSalt,
        'typeOfUser': typeOfUser.toString(),
        'email': Gloablvar.Email
      },
    ).then((value) {
      model = RegisterModel.fromJson(value.data);
      Gloablvar.id = model.data.id;
      if (kDebugMode) {
        print(model.data.id + 'id');
      }
      if (kDebugMode) {
        print(model.status);
      }
      if (kDebugMode) {
        print(model.message);
      }

      if (kDebugMode) {
        print(value.data);
      }

      emit(Registersuccess(model));
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(Registererror(error.toString()));
    });
  }
}
