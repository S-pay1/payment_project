// ignore_for_file: avoid_print

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

import '../../../../models/company_model/company_history_model.dart';
import '../../../../shared/global.dart';

part 'company_state.dart';

class CompanyCubit extends Cubit<CompanyState> {
  CompanyCubit() : super(CompanyInitial());
  static CompanyCubit get(context) => BlocProvider.of(context);
  CompanyModel model;
  void Companylogin({
    @required String email,
    @required String password,
    @required String typeOfUser,
  }) {
    typeOfUser = 'company';
    emit(Companyloading());
    DioHelper.postData(
      url: LOGINs,
      data: {
        'email': email,
        'password': password,
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

  CompanyHistoryModel rmodel;
  void Historycompany({
    @required String company_id,
  }) {
    emit(Companyloading());
    DioHelper.getData(url: Companyhistory, query: {
      'company_id': Gloablvar.id,
    }).then((value) {
      rmodel = CompanyHistoryModel.fromJson(value.data);

      print(value.data);
      emit(CompanyHistorysuccess());
    }).catchError((onError) {
      print('catch error');
      emit(CompanyHistoryerror());
      print(onError.toString());
    });
  }
}
