//import 'package:udemy_flutter/models/user/user/login/login_model.dart';

// ignore_for_file: camel_case_types

abstract class HomecubitState {}

class HomecubitInitial extends HomecubitState {}

class HomecubitLoading extends HomecubitState {}

class HomecubitBottomNav extends HomecubitState {}

class HomecubitService extends HomecubitState {}

class HomecubitSucees extends HomecubitState {}

class HomecubitEroor extends HomecubitState {}

class Historyloading extends HomecubitState {}

class Historysuccess extends HomecubitState {}

class Historyerror extends HomecubitState {}

class walletloading extends HomecubitState {}

class walletsuccess extends HomecubitState {}

class walletyerror extends HomecubitState {}

class PaySucees extends HomecubitState {}

class PayEroor extends HomecubitState {}
