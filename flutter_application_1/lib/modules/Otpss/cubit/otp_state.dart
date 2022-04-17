part of 'otp_cubit.dart';

@immutable
abstract class OtpState {}

class OtpInitial extends OtpState {}

class Otploading extends OtpState {}

class Otpsuccess extends OtpState {
  final OtpModel model;

  Otpsuccess(this.model);
}

class Otperror extends OtpState {
  final String error;
  Otperror(this.error);
}
