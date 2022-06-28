class ResetModel {
  bool status;
  String message;

  ResetModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }
}
