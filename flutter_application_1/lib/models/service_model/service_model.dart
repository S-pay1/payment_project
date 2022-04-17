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
//   String company_id;
//   //String phone;

//   UserData.fromJason(Map<String, dynamic> json) {
//     client_id = json['client_id'];
//     company_id = json['company_id'];
//     //phone = json['phone'];
//   }
// }
// class ServiceModel {
//   bool status;
//   String message;
//   UserData data;

//   ServiceModel({this.message, this.data, this.status});

//   ServiceModel.fromJson(Map<String, dynamic> json) {
//     message = json['message'];
//     status = json['status'];
//     data = json['data'] != null ? UserData.fromJson(json['data']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.message;
//     if (this.data != null) {
//       data['data'] = this.data.toJson();
//     }
//     return data;
//   }
// }

// class UserData {
//   String companyId;
//   String serviceCode;
//   String price;
//   String clientId;

//   UserData({this.companyId, this.serviceCode, this.price, this.clientId});

//   UserData.fromJson(Map<String, dynamic> json) {
//     companyId = json['company_id'];
//     serviceCode = json['service_code'];
//     price = json['price'];
//     clientId = json['client_id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['company_id'] = this.companyId;
//     data['service_code'] = this.serviceCode;
//     data['price'] = this.price;
//     data['client_id'] = this.clientId;
//     return data;
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
  String client_id;
  // String name;
  // String phone;

  UserData.fromJason(Map<String, dynamic> json) {
    client_id = json['client_id'];
    // name = json['name'];
    // phone = json['phone'];
  }
}
