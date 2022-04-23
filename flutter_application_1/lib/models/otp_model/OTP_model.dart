class OtpModel {
  bool status;
  String message;
  UserData data;

  OtpModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
    // data = UserData.fromJson(json['data'] as Map<String, dynamic>);
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
