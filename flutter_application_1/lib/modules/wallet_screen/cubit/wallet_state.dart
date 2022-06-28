part of 'wallet_cubit.dart';

@immutable
abstract class WalletState {}

class WalletInitial extends WalletState {}

class WalletLoading extends WalletState {}

class WalletSucces extends WalletState {}

class WalletEroor extends WalletState {
  final String error;
  WalletEroor(this.error);
}
