part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class Registerloading extends RegisterState {}

class Registersuccess extends RegisterState {
  final RegisterModel model;

  Registersuccess(this.model);
}

class Registererror extends RegisterState {
  final String error;
  Registererror(this.error);
}

class RegisterpaswwordChange extends RegisterState {}
