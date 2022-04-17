// ignore_for_file: non_constant_identifier_names, unused_local_variable, unused_element

import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/models/service_model/service_model.dart';
import 'package:flutter_application_1/shared/dio/dio_helper.dart';
import 'package:flutter_application_1/shared/dio/end_points.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../shared/global.dart';

part 'service_state.dart';

class ServiceCubit extends Cubit<ServiceState> {
  ServiceCubit() : super(ServiceInitial());
  static ServiceCubit get(context) => BlocProvider.of(context);
  int counterIndex;
  List<String> ChosseService = [
    'gas',
    'water',
    'electric',
    'phone',
    'landing',
    'wifi',
  ];
  List<String> Servicecode = [
    'Service code',
    'Service code',
    'Service code',
    'phone number',
    'landing number',
    'number',
  ];
  List<String> ServicCompany = [
    'company',
    'company',
    'company',
    'Network',
    'landing number',
    'number',
  ];
  int indexOfServices;

  void changeindexscreen(text) {
    Global.indexOfServices = ChosseService.indexOf(text);
    // Global.indexOfServices = Servicecode.indexOf(text);
    // Global.indexOfServices = ServicCompany.indexOf(text);
    print(Global.indexOfServices);
  }

  ServiceModel model;
  void userService({
    String client_id,
    // @required String company_id,
    @required String price,
    @required String service_code,
  }) {
    emit(Serviceloading());
    DioHelper.postData(
      url: Payment,
      data: {
        'client_id': '209ba818e6ce46d1986f',
        // 'company_id': company_id,
        'price': int.parse(price),
        'service_code': int.parse(service_code),
        'feeds': 1,
      },
    ).then((value) {
      model = ServiceModel.fromJson(value.data);
      print(model.status);
      print(model.message);
      //print(model.data.token);
      print(value.data);

      emit(Servicesuccess(model));
    }).catchError((error) {
      emit(Serviceerror(error.toString()));
      print(error.toString());
    });
  }
}
