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
  // String phone;
  String email;
  String bank_account;
  String tax_number;
  String personal_id;
  String service;

  CompanySignupData.fromJason(Map<String, dynamic> json) {
    id = json['id'].toString();
    name = json['name'].toString();
    // phone = json['phone'];
    email = json['email'].toString();
    bank_account = json['bank_account'].toString();
    tax_number = json['tax_number'].toString();
    personal_id = json['personal_id'].toString();
    service = json['service'].toString();
  }
}
