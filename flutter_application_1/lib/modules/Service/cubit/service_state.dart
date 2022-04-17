part of 'service_cubit.dart';

@immutable
abstract class ServiceState {}

class ServiceInitial extends ServiceState {}

class Serviceloading extends ServiceState {}

class Servicesuccess extends ServiceState {
  final ServiceModel model;

  Servicesuccess(this.model);
}

class Serviceerror extends ServiceState {
  final String error;
  Serviceerror(this.error);
}
