import 'package:flutter_application_1/models/pay_model.dart';

abstract class PayWalletState {}

class PayWalletInitila extends PayWalletState {}

class PayWalletLoading extends PayWalletState {}

class PayWalletsuccess extends PayWalletState {
  final PayModel model;
  PayWalletsuccess(this.model);
}

class PayWalleterror extends PayWalletState {}
