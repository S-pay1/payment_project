// class ServiceModel {
//   bool status;
//  var message;
//   UserData data;

//   ServiceModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     data = json['data'] != null ? UserData.fromJason(json['data']) : null;
//   }
// }

// class UserData {
//  var client_id;
//  var service_code;
//   var price;
//  var company_name;
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
//   var feeds;
//   var total;
//  var date;

//   ReceiptsData.fromJson(Map<String, dynamic> json) {
//     feeds = var.parse(json['feeds']);
//     total = var.parse(json['total']);
//     date = json['date'];
//   }
// }

class ServiceModel {
  bool status;
  var message;
  UserData data;

  ServiceModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? UserData.fromJason(json['data']) : null;
  }
}

class UserData {
  //var client_id;
  // int service_code;
  // var price;
  //var companyName;
  // var feeds;
  // var total;
  //var date;
  var client_id;
  var service_code;
  var price;
  var company_name;
  var feeds;
  var total;
  var date;
  var id;

  UserData.fromJason(Map<String, dynamic> json) {
    client_id = json['client_id'].toString();
    id = json['id'].toString();
    service_code = json['service_code'];
    price = json["price"];
    company_name = json['company_name'].toString();
    feeds = json['receipt']['feeds'];
    total = json['receipt']['total'];
    date = json['receipt']['date'].toString();
  }
}
