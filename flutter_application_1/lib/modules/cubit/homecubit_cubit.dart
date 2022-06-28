import 'package:flutter/material.dart';

import 'package:flutter_application_1/modules/history_screen/history.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

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
}
