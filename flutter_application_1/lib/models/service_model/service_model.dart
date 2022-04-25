// class ServiceModel {
//   bool status;
//   String message;
//   UserData data;

//   ServiceModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     data = json['data'] != null ? UserData.fromJason(json['data']) : null;
//   }
// }

// class UserData {
//   String client_id;
//   String service_code;
//   double price;
//   String company_name;
//   ReceiptsData receiptsData;

//   UserData.fromJason(Map<String, dynamic> json) {
//     client_id = json['client_id'];
//     service_code = json['service_code'];
//     price = json["price"];
//     company_name = json['company_name'];
//     receiptsData = ReceiptsData.fromJson(json['receipt']);
//   }
// }

// class ReceiptsData {
//   double feeds;
//   double total;
//   String date;

//   ReceiptsData.fromJson(Map<String, dynamic> json) {
//     feeds = double.parse(json['feeds']);
//     total = double.parse(json['total']);
//     date = json['date'];
//   }
// }

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
  // String client_id;
  // int service_code;
  // double price;
  // String companyName;
  // double feeds;
  // double total;
  // String date;
  String client_id;
  String service_code;
  double price;
  String company_name;
  double feeds;
  double total;
  String date;

  UserData.fromJason(Map<String, dynamic> json) {
    client_id = json['client_id'].toString();
    service_code = json['service_code'];
    price = json["price"];
    company_name = json['company_name'].toString();
    feeds = double.parse(json['receipt']['feeds']);
    total = double.parse(json['receipt']['total']);
    date = json['receipt']['date'].toString();
  }
}
