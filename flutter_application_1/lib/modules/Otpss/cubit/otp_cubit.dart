// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:flutter_application_1/models/otp_model/otp_model.dart';

import 'package:flutter_application_1/shared/dio/end_points.dart';
import 'package:flutter_application_1/shared/global.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../shared/dio/dio_helper.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(OtpInitial());
  static OtpCubit get(context) => BlocProvider.of(context);

  OtpModel model;
  void userOtpCheak({
    String id,
    String otp,
  }) {
    emit(Otploading());
    //id = RegisterCubit.get(context).model.data.id;
    DioHelper.postData(
      url: CHEAKOTP,
      data: {
        'otp_num': int.parse(otp),
        'client_id': Gloablvar.id,
      },
    ).then((value) {
      model = OtpModel.fromJson(value.data);
      print(model.status);
      print(model.message);
      //print(model.data.token);
      print(value.data);

      emit(Otpsuccess(model));
    }).catchError((error) {
      emit(Otperror(error.toString()));
      print(error.toString());
    });
  }

  void userOtpResend({
    @required String id,
  }) {
    emit(Otploading());
    DioHelper.postData(url: ResendOtp, data: {'id': id}).then((value) {
      model = OtpModel.fromJson(value.data);
      print(model.status);
      print(model.message);
      //print(model.data.token);
      print(value.data);

      emit(Otpsuccess(model));
    }).catchError((error) {
      emit(Otperror(error.toString()));
      print(error.toString());
    });
  }
}
