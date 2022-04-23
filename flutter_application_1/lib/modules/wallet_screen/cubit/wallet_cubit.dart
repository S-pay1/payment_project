import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/models/wallet_model/wallet_model.dart';
import 'package:flutter_application_1/shared/dio/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  WalletCubit() : super(WalletInitial());
  static WalletCubit get(context) => BlocProvider.of(context);

  WalletModel model;
  void userwallet() {
    emit(WalletLoading());
    DioHelper.getData(
            // url: url
            )
        .then((value) {
      model = WalletModel.fromJson(value.data);
      print(value.data);
      emit(WalletSucces(model));
    }).catchError((onError) {
      print('catch error');
      emit(WalletEroor(onError.toString()));
      print(onError.toString());
    });
  }
}
