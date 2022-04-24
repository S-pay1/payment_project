class ResetModel {
  bool status;
  String message;
  // ResetData data;

  ResetModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    //   data = json['data'] != null ? ResetData.fromJason(json['data']) : null;
  }
}

// class ResetData {
//   String id;

//   String phone;

//   ResetData.fromJason(Map<String, dynamic> json) {
//     id = json['id'].toString();

//     phone = json['phone'].toString();
//   }
// }
