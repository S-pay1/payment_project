part of 'Password_cubit.dart';

@immutable
abstract class passwordState {}

class passwordInitial extends passwordState {}

class passwordloading extends passwordState {}

class passwordsuccess extends passwordState {}

class passworderror extends passwordState {
  final String error;
  passworderror(this.error);
}

class passwordpaswwordChange extends passwordState {}
