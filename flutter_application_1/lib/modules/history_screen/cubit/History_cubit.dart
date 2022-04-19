import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/models/history_model/histoy_model.dart';
import 'package:flutter_application_1/modules/history_screen/cubit/History_state.dart';

import 'package:flutter_application_1/shared/dio/dio_helper.dart';
import 'package:flutter_application_1/shared/dio/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meta/meta.dart';

class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit() : super(HistoryInitial());
  static HistoryCubit get(context) => BlocProvider.of(context);

  HistoryModel model;
  void HistoryData() {
    emit(Historyloading());

    DioHelper.getData(
      url: clients,
    ).then((value) {
      model = HistoryModel.fromJson(value.data);
      print(model.data);
      print(model.status);
      print(model.message);
      //print(model.data.token);
      print(value.data);

      // emit(Historysuccess(model));
      emit(Historysuccess());
    }).catchError((error) {
      // emit(Historyerror(error.toString()));
      emit(Historyerror());
      print(error.toString());
    });
  }
}
