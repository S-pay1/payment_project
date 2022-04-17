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
  String company_id;
  //String phone;

  UserData.fromJason(Map<String, dynamic> json) {
    client_id = json['client_id'];
    company_id = json['company_id'];
    //phone = json['phone'];
  }
}
