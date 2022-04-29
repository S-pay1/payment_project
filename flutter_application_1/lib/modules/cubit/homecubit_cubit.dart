// ignore_for_file: unused_import, unnecessary_import

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/history_model/histoy_model.dart';
import 'package:flutter_application_1/modules/history_screen/cubit/History_cubit.dart';
import 'package:flutter_application_1/modules/history_screen/history.dart';
import 'package:flutter_application_1/shared/dio/dio_helper.dart';
import 'package:flutter_application_1/shared/dio/end_points.dart';
import 'package:flutter_application_1/shared/global.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/wallet_model/wallet_model.dart';
import '../home_screen/home.dart';
import '../wallet_screen/wallet.dart';
import 'homecubit_state.dart';

//import 'package:udemy_flutter/models/user/user/login/login_model.dart';

class HomecubitCubit extends Cubit<HomecubitState> {
  HomecubitCubit() : super(HomecubitInitial());

  static HomecubitCubit get(context) => BlocProvider.of(context);
  int currentindex = 0;

  int i = 0;

  List<Widget> screens = [
    home(),
    Wallet(),
    History(),
  ];
  List<String> titles = [
    'home',
    'wallet',
    'History',
  ];

  void changeindex(int index) {
    currentindex = index;

    emit(HomecubitBottomNav());
  }

  // WalletModel rmodel;
  // void userwallet() {
  //   emit(walletloading());
  //   DioHelper.getData(url: walletshow, query: {
  //     'client_id': Gloablvar.id,
  //   }).then((value) {
  //     rmodel = WalletModel.fromJson(value.data);
  //     Gloablvar.balance = rmodel.data.balance;
  //     print(value.data);
  //     emit(walletsuccess());
  //   }).catchError((onError) {
  //     print('catch error');
  //     emit(walletyerror());
  //     print(onError.toString());
  //   });
  // }

  void paywithpassword(@required String password) {
    DioHelper.postData(url: paywithwalletss, data: {
      'client_id': Gloablvar.id,
      'password': password,
      'total': Gloablvar.total
    }).then((value) {
      print(Gloablvar.id);
      print(Gloablvar.total);
      print(value.data);
      emit(HomecubitSucees());
    }).catchError((onError) {
      emit(HomecubitEroor());
      print(Gloablvar.id);
      print(Gloablvar.total);
      print(onError.toString());
    });
  }
}
