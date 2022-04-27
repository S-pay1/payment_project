part of 'company_cubit.dart';

@immutable
abstract class CompanyState {}

class CompanyInitial extends CompanyState {}

class Companyloading extends CompanyState {}

class Companysuccess extends CompanyState {
  final CompanyModel model;

  Companysuccess(this.model);
}

class Companyerror extends CompanyState {
  final String error;
  Companyerror(this.error);
}

class CompanypaswwordChange extends CompanyState {}

class CompanyHistorysuccess extends CompanyState {
  // final CompanyHistoryModel model;

  // CompanyHistorysuccess(this.model);
}

class CompanyHistoryerror extends CompanyState {
  // final String error;
  // CompanyHistoryerror(this.error);
}
