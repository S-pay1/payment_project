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

class ServiceGetloading extends ServiceState {}

class ServiceGetsuccess extends ServiceState {
  final DataModel Companymodel;

  ServiceGetsuccess(this.Companymodel);
}

class ServiceGeterror extends ServiceState {
  final String error;
  ServiceGeterror(this.error);
}
