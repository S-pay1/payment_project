// ignore_for_file: non_constant_identifier_names

class ServiceModel {
  bool status;
  String message;
  UserData data;

  ServiceModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? UserData.fromJason(json['data']) : null;
  }
}

class UserData {
  String client_id;
  int service_code;
  int price;
  String companyName;
  ReceiptsData receiptsData;

  UserData.fromJason(Map<String, dynamic> json) {
    client_id = json['client_id'];
    service_code = json['service_code'];
    price = int.tryParse(json["price"]);
    companyName = json['company_name'];
    receiptsData = ReceiptsData.fromJson(json['receipt']);
  }
}

class ReceiptsData {
  double feeds;
  double total;
  String date;

  ReceiptsData.fromJson(Map<String, dynamic> json) {
    feeds = json['feeds'];
    total = json['total'];
    date = json['date'];
  }
}
