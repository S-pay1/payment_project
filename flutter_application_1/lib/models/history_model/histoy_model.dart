// ignore_for_file: camel_case_types, non_constant_identifier_names

class HistoryModel {
  bool status;
  String message;
  HistoryData data;

  HistoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = HistoryData.fromJson(json['data'] as Map<String, dynamic>);
  }
}

class HistoryData {
  List<recivedata> payments = [];
  HistoryData.fromJson(Map<String, dynamic> json) {
    json['payments'].forEach((element) {
      payments.add(recivedata.fromJson(element));
    });
  }
}

class recivedata {
  String id;
  String company_name;
  String date;
  String total;
  recivedata.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    company_name = json['company_name'];
    date = json['date'];
    total = json['total'].toString();
  }
}
