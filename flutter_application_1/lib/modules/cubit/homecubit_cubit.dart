// ignore_for_file: unused_import, unnecessary_import

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/history_model/histoy_model.dart';
import 'package:flutter_application_1/modules/history_screen/cubit/History_cubit.dart';
import 'package:flutter_application_1/shared/dio/dio_helper.dart';
import 'package:flutter_application_1/shared/dio/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//import 'package:udemy_flutter/models/user/user/login/login_model.dart';

import '../history_screen/history.dart';
import '../home_screen/home.dart';
import '../wallet_screen/wallet.dart';
import 'homecubit_state.dart';

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

  //Trying my shit
  HistoryModel model;
  void HistoryData() {
    emit(Historyloading());
    // getHistoryData().then((value) {
    //   emit(Historysuccess());
    // }).catchError((onError) {
    //   emit(Historyerror());
    //   print(onError.toString());
    // });
    DioHelper.getData(
      url: clients,
    ).then((value) {
      model = HistoryModel.fromJson(value.data);
      print(model.data);
      print(model.status);
      print(model.message);
      //print(model.data.token);
      print(value.data);

      // emit(Historysuccess(model));
      emit(Historysuccess(model));
    }).catchError((error) {
      // emit(Historyerror(error.toString()));
      emit(Historyerror(error.toString()));
      print(error.toString());
    });
  }
}

  // List<HistoryModel> historyData;

  // final DioHelper dioHelper;
  // Future<List<HistoryModel>> getHistoryData() async {
  //   final history = await dioHelper.getTheHistory();
  //   return history.map((history) => HistoryModel.fromJson(history)).toList();
   
  

