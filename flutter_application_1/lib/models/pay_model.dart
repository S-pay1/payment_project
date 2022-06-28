class PayModel {
  bool status;
  String message;

  PayModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'].toString();
  }
}
