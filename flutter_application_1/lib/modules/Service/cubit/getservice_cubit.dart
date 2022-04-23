// import 'package:bloc/bloc.dart';
// import 'package:flutter_application_1/models/service_model/get_service_model.dart';
// import 'package:flutter_application_1/shared/dio/dio_helper.dart';
// import 'package:flutter_application_1/shared/dio/end_points.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:meta/meta.dart';

// import 'getservice_state.dart';

// class GetserviceCubit extends Cubit<GetserviceState> {
//   GetserviceCubit() : super(GetserviceInitial());
//   static GetserviceCubit get(context) => BlocProvider.of(context);
  

//   DataModel model;
//   void companyData() {
//     emit(Getserviceloading());

//     DioHelper.getData(
//       url: getserve,
//     ).then((value) {
//       model = DataModel.fromJson(value.data);
//       print(value.data);

//       emit(Getservicesuccess());
//     }).catchError((error) {
//       print('catch error');
//       emit(Getserviceerror());
//       print(error.toString());
//     });
//   }
// }
