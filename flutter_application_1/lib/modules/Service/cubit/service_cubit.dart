// ignore_for_file: non_constant_identifier_names, unused_local_variable, unused_element, avoid_print, void_checks

import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/models/service_model/service_model.dart';
import 'package:flutter_application_1/shared/dio/dio_helper.dart';
import 'package:flutter_application_1/shared/dio/end_points.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/service_model/get_service_model.dart';
import '../../../shared/global.dart';

part 'service_state.dart';

class ServiceCubit extends Cubit<ServiceState> {
  ServiceCubit() : super(ServiceInitial());
  static ServiceCubit get(context) => BlocProvider.of(context);
  int counterIndex;

  List<String> ChosseService = [
    'gas',
    'water',
    'Electronic',
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
    String company_name,
    @required double price,
    @required String service_code,
  }) {
    emit(Serviceloading());
    var feeds = price * (0.02);

    var data = {
      'client_id': Gloablvar.id,
      'company_id': company_name,
      'price': price,
      'service_code': service_code,
      'feeds': feeds,
    };
    print(data);
    DioHelper.postData(
      url: Payment,
      data: {
        'client_id': Gloablvar.id,
        'company_name': company_name,
        'price': price,
        'service_code': service_code,
        'feeds': feeds,
      },
    ).then((value) {
      model = ServiceModel.fromJson(value.data);

      Gloablvar.feeds = model.data.feeds;
      Gloablvar.price = model.data.price;
      Gloablvar.service_code = model.data.service_code;
      Gloablvar.total = model.data.total;
      Gloablvar.date = model.data.date;
      print(Gloablvar.feeds);
      print(Gloablvar.price);
      print(Gloablvar.service_code);
      print(Gloablvar.date);
      print(Gloablvar.total);
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

  DataModel Companymodel;
  void companyData(text) {
    Gloablvar.itemsOfDropDown = [];
    emit(ServiceGetloading());
    print(text);
    DioHelper.getData(url: getserve, query: {
      'service': text,
    }).then((value) {
      Companymodel = DataModel.fromJson(value.data);
      for (var element in Companymodel.data.companies) {
        Gloablvar.itemsOfDropDown.add(element.name);
      }

      print(value.data);
      print(Gloablvar.itemsOfDropDown);

      emit(ServiceGetsuccess(Companymodel));
    }).catchError((error) {
      print('catch error');
      emit(ServiceGeterror(error.toString()));
      print(error.toString());
    });
    return;
  }
}
