// ignore_for_file: unused_import, unnecessary_import

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
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

  // int counterIndex;

  // List<String> ChosseService = [
  //   'gas',
  //   'water',
  //   'electric',
  //   'phone',
  //   'landing',
  //   'wifi',
  // ];
  // List<String> Servicecode = [
  //   'Service code',
  //   'Service code',
  //   'Service code',
  //   'phone number',
  //   'landing number',
  //   'number',
  // ];
  // List<String> ServicCompany = [
  //   'company',
  //   'company',
  //   'company',
  //   'Network',
  //   'landing number',
  //   'number',
  // ];
  void changeindex(int index) {
    currentindex = index;
    emit(HomecubitBottomNav());
  }

  // void changeindexscreen(int index) {
  //   currentIndex = index;
  //     emit(HomecubitService());

  // }
  // int indexOfServices;
  // void changeindexscreen(text) {
  //   Global.indexOfServices = ChosseService.indexOf(text);
  //   // Global.indexOfServices = Servicecode.indexOf(text);
  //   // Global.indexOfServices = ServicCompany.indexOf(text);
  //   print(Global.indexOfServices);

  //emit(HomecubitService());
}
