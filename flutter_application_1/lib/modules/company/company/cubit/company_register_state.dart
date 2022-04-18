import 'package:flutter/cupertino.dart';

import '../../../../models/company_model/company_register_model.dart';

@immutable
abstract class CompanySingUpState {}

class CompanySingUpInitial extends CompanySingUpState {}

class CompanySingUploading extends CompanySingUpState {}

class CompanySingUpsuccess extends CompanySingUpState {
  final CompanySignupModel model;

  CompanySingUpsuccess(this.model);
}

class CompanySingUperror extends CompanySingUpState {
  final String error;
  CompanySingUperror(this.error);
}

class CompanySingUppaswwordChange extends CompanySingUpState {}
