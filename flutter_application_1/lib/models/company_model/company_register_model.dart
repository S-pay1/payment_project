class CompanySignupModel {
  bool status;
  String message;
  CompanySignupData data;

  CompanySignupModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data =
        json['data'] != null ? CompanySignupData.fromJason(json['data']) : null;
  }
}

class CompanySignupData {
  String id;
  String name;
  String phone;

  CompanySignupData.fromJason(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
  }
}
