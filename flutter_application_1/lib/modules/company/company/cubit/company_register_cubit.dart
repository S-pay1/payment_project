import '../../../../models/company_model/company_register_model.dart';

import 'company_register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../shared/dio/dio_helper.dart';
import '../../../../shared/dio/end_points.dart';

class CompanySingUpCubit extends Cubit<CompanySingUpState> {
  CompanySingUpCubit() : super(CompanySingUpInitial());
  static CompanySingUpCubit get(context) => BlocProvider.of(context);

  CompanySignupModel model;
  void Companysignup({
    // @required int phone,
    @required String email,
    @required String bank_account,
    @required String commercial,
    @required String tax_number,
    @required String personal_id,
    @required String Service,

    // @required String password,
    @required String typeOfUser,
    @required String name,
  }) {
    typeOfUser = 'company';
    emit(CompanySingUploading());

    DioHelper.postData(
      url: REIGSTERs,
      data: {
        'email': email,
        'bank_account': bank_account,
        'commercial': commercial,
        'tax_number': tax_number,
        'personal_id': personal_id,
        'name': name,
        'typeOfUser': typeOfUser.toString(),
        'service': Service
      },
    ).then((value) {
      model = CompanySignupModel.fromJson(value.data);
      print(model.status);
      print(model.message);

      print(value.data);

      emit(CompanySingUpsuccess(model));
    }).catchError((error) {
      emit(CompanySingUperror(error.toString()));
      print(error.toString());
    });
  }
}
