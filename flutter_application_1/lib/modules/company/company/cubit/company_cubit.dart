import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/models/company_model/company_login_model.dart';
import 'package:flutter_application_1/shared/dio/dio_helper.dart';
import 'package:flutter_application_1/shared/dio/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'company_state.dart';

class CompanyCubit extends Cubit<CompanyState> {
  CompanyCubit() : super(CompanyInitial());
  static CompanyCubit get(context) => BlocProvider.of(context);
  CompanyModel model;
  void Companylogin({
    // @required String phone,
    @required String email,
    // @required double bank_account,
    // @required double commercial,
    // @required double tax_number,
    // @required double id,
    @required String password,
    @required String typeOfUser,
    // @required String name,
  }) {
    var pas = utf8.encode(password);
    var hashPassword = sha256.convert(pas);
    typeOfUser = 'Company';
    emit(Companyloading());
    DioHelper.postData(
      url: company,
      data: {
        'email': email,
        // 'bank_account': bank_account,
        // 'commercial': commercial,
        // 'tax_number': tax_number,
        // 'id': id,
        // 'name': name,
        // 'phone': phone,
        'password': hashPassword.toString(),
        'type': 'user',
        'typeOfUser': typeOfUser.toString()
      },
    ).then((value) {
      model = CompanyModel.fromJson(value.data);
      print(model.status);
      print(model.message);
      //print(model.data.token);
      print(value.data);

      emit(Companysuccess(model));
    }).catchError((error) {
      emit(Companyerror(error.toString()));
      print(error.toString());
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(CompanypaswwordChange());
  }
}
