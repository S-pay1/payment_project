import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/models/company_model/company_register_model.dart';
import 'package:flutter_application_1/modules/company/company/CompanySignUp.dart';
import 'package:flutter_application_1/modules/company/company/cubit/company_register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../shared/dio/dio_helper.dart';
import '../../../../shared/dio/end_points.dart';

class CompanySingUpCubit extends Cubit<CompanySingUpState> {
  CompanySingUpCubit() : super(CompanySingUpInitial());
  static CompanySingUpCubit get(context) => BlocProvider.of(context);

  CompanySignupModel model;
  void Companysignup({
    @required String phone,
    @required String email,
    @required double bank_account,
    @required double commercial,
    @required double tax_number,
    @required double personal_id,
    // @required String password,
    @required String typeOfUser,
    @required String name,
  }) {
    // var pas = utf8.encode(password);
    // var hashPassword = sha256.convert(pas);
    typeOfUser = 'Company';
    emit(CompanySingUploading());
    DioHelper.postData(
      url: company,
      data: {
        'email': email,
        'bank_account': bank_account,
        'commercial': commercial,
        'tax_number': tax_number,
        'id': personal_id,
        'name': name,
        'phone': phone,
        // 'password': hashPassword.toString(),

        'typeOfUser': typeOfUser.toString()
      },
    ).then((value) {
      model = CompanySignupModel.fromJson(value.data);
      print(model.status);
      print(model.message);
      //print(model.data.token);
      print(value.data);

      emit(CompanySingUpsuccess(model));
    }).catchError((error) {
      emit(CompanySingUperror(error.toString()));
      print(error.toString());
    });
  }
}
