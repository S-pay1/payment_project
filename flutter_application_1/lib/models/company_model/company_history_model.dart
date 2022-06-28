// ignore_for_file: camel_case_types, non_constant_identifier_names, prefer_typing_uninitialized_variables

class CompanyHistoryModel {
  bool status;
  var message;
  CompanyHistoryData data;

  CompanyHistoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = CompanyHistoryData.fromJson(json['data'] as Map<String, dynamic>);
  }
}

class CompanyHistoryData {
  List<recivedata> payments = [];
  CompanyHistoryData.fromJson(Map<String, dynamic> json) {
    json['payments'].forEach((element) {
      payments.add(recivedata.fromJson(element));
    });
  }
}

class recivedata {
  var service_code;
  var date;
  var price;
  recivedata.fromJson(Map<String, dynamic> json) {
    service_code = json['service_code'];
    price = json['price'];
    date = json['date'];
  }
}
