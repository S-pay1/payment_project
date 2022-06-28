// ignore_for_file: file_names

class OtpModel {
  bool status;
  String message;
  UserData data;

  OtpModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }
}

class UserData {
  String id;
  String otp;

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    otp = json['otp'];
  }
}
