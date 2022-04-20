//import 'package:udemy_flutter/models/user/user/login/login_model.dart';

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
