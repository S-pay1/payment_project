// ignore_for_file: non_constant_identifier_names, unused_local_variable, unused_element, avoid_print

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
    'other service',
  ];
  List<String> Servicecode = [
    'Service code',
    'Service code',
    'Service code',
    'phone number',
    'landing number',
    'number',
    'opreation number',
  ];
  List<String> ServicCompany = [
    'company',
    'company',
    'company',
    'Network',
    'landing number',
    'number',
    'number',
  ];
  List itemsOfDropDown = [
    'ezz',
    'hesham',
    'youssef',
    'mo\'men',
    'yehya',
    'l',
    'g',
    't',
    'm',
    'y',
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
    String company_id,
    @required int price,
    @required int service_code,
  }) {
    emit(Serviceloading());
    var feeds = price * (0.02);

    DioHelper.postData(
      url: Payment,
      data: {
        'client_id': Gloablvar.id,
        'company_id': company_id,
        'price': price,
        'service_code': service_code,
        'feeds': feeds,
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
