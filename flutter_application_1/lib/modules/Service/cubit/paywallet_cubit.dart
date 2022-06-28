import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/modules/Service/cubit/paywallet_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/pay_model.dart';
import '../../../shared/dio/dio_helper.dart';
import '../../../shared/dio/end_points.dart';
import '../../../shared/global.dart';

class PayWalletCubit extends Cubit<PayWalletState> {
  PayWalletCubit() : super(PayWalletInitila());
  static PayWalletCubit get(context) => BlocProvider.of(context);
  PayModel model;
  void paywithpassword(String password) {
    var pas = utf8.encode(password);
    var hashPassword = sha256.convert(pas);

    emit(PayWalletLoading());
    var dd = {
      'client_id': Gloablvar.id,
      'password': hashPassword.toString(),
      'total': Gloablvar.total,
      'payment_id': Gloablvar.Paymentid,
    };
    if (kDebugMode) {
      print(dd);
    }
    DioHelper.postData(url: paywithwalletss, data: {
      'client_id': Gloablvar.id,
      'password': hashPassword.toString(),
      'total': Gloablvar.total,
      'payment_id': Gloablvar.Paymentid,
    }).then((value) {
      if (kDebugMode) {
        print('then');
      }
      model = PayModel.fromJson(value.data);
      if (kDebugMode) {
        print(Gloablvar.id);
      }
      if (kDebugMode) {
        print(Gloablvar.total);
      }
      if (kDebugMode) {
        print(value.data);
      }
      emit(PayWalletsuccess(model));
    }).catchError((error) {
      emit(PayWalleterror());
      if (kDebugMode) {
        print('eroor');
      }
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
