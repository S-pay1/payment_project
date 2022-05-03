//import 'package:udemy_flutter/models/user/user/login/login_model.dart';

import 'package:flutter_application_1/models/pay_model.dart';

import '../../models/history_model/histoy_model.dart';
import '../../models/user_model/Register_model.dart';

abstract class HomecubitState {}

class HomecubitInitial extends HomecubitState {}

class HomecubitLoading extends HomecubitState {}

class HomecubitBottomNav extends HomecubitState {}

class HomecubitService extends HomecubitState {}

class HomecubitSucees extends HomecubitState {}

class HomecubitEroor extends HomecubitState {}

class Historyloading extends HomecubitState {}

class Historysuccess extends HomecubitState {
  // final HistoryModel model;

  // Historysuccess(this.model);
}

class Historyerror extends HomecubitState {
  // final String error;
  // Historyerror(this.error);
}

class walletloading extends HomecubitState {}

class walletsuccess extends HomecubitState {
  // final HistoryModel model;

  // Historysuccess(this.model);
}

class walletyerror extends HomecubitState {
  // final String error;
  // Historyerror(this.error);
}

class PaySucees extends HomecubitState {
  // final PayModel model;
  // PaySucees(this.model);
}

class PayEroor extends HomecubitState {
  // final String error;
  // PayEroor(this.error);
}
