// ignore_for_file: avoid_print, non_constant_identifier_names, file_names

import 'package:flutter_application_1/models/history_model/histoy_model.dart';
import 'package:flutter_application_1/modules/history_screen/cubit/History_state.dart';

import 'package:flutter_application_1/shared/dio/dio_helper.dart';
import 'package:flutter_application_1/shared/dio/end_points.dart';
import 'package:flutter_application_1/shared/global.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit() : super(HistoryInitial());
  static HistoryCubit get(context) => BlocProvider.of(context);

  HistoryModel model;
  void HistoryData() {
    emit(Historyloading());

    DioHelper.getData(url: history, query: {'id': Gloablvar.id}).then((value) {
      model = HistoryModel.fromJson(value.data);

      print(value.data);

      emit(Historysuccess());
    }).catchError((error) {
      print('catch error');
      print(Gloablvar.id);
      emit(Historyerror());
      print(error.toString());
    });
  }
}
