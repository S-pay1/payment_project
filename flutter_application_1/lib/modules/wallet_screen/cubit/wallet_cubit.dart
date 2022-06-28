import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/models/wallet_model/wallet_model.dart';
import 'package:flutter_application_1/shared/dio/dio_helper.dart';
import 'package:flutter_application_1/shared/dio/end_points.dart';
import 'package:flutter_application_1/shared/global.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  WalletCubit() : super(WalletInitial());
  static WalletCubit get(context) => BlocProvider.of(context);

  WalletModel model;
  void userwallet() {
    emit(WalletLoading());
    DioHelper.getData(url: walletshow, query: {
      'client_id': Gloablvar.id,
    }).then((value) {
      model = WalletModel.fromJson(value.data);
      Gloablvar.balance = model.data.balance;
      if (kDebugMode) {
        print(value.data);
      }
      emit(WalletSucces());
    }).catchError((onError) {
      if (kDebugMode) {
        print('catch error');
      }
      emit(WalletEroor(onError.toString()));
      if (kDebugMode) {
        print(onError.toString());
      }
    });
  }
}
