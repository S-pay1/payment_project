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

class Checksuccess extends RegisterState {
  final ResetModel remodel;

  Checksuccess(this.remodel);
}

class Checkererror extends RegisterState {
  final String error;
  Checkererror(this.error);
}

class passwordUpdataSuccess extends RegisterState {
  final ResetModel remodel;
  passwordUpdataSuccess(this.remodel);
}

class passwordUpdataError extends RegisterState {
  final String error;
  passwordUpdataError(this.error);
}
