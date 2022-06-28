class CompanyModel {
  bool status;
  String message;
  CompanyData data;

  CompanyModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? CompanyData.fromJason(json['data']) : null;
  }
}

class CompanyData {
  String id;
  String email;
  String phone;

  CompanyData.fromJason(Map<String, dynamic> json) {
    id = json['id'];
    email = json['name'];
    phone = json['phone'];
  }
}
