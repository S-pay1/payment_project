part of 'Login_cubit.dart';

@immutable
abstract class loginState {}

class loginInitial extends loginState {}

class loginloading extends loginState {}

class loginsuccess extends loginState {
  final LoginModel model;

  loginsuccess(this.model);
}

class loginerror extends loginState {
  final String error;
  loginerror(this.error);
}

class loginpaswwordChange extends loginState {}

class Getmac extends loginState {}

class loginOtpsuccess extends loginState {}

class loginOtperror extends loginState {}
