// ignore_for_file: prefer_typing_uninitialized_variables, file_names

class RegisterModel {
  bool status;
  String message;
  UserData data;

  RegisterModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? UserData.fromJason(json['data']) : null;
  }
}

class UserData {
  String id;
  String name;
  var email;
  String phone;

  UserData.fromJason(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
  }
}
