class HistoryModel {
  bool status;
  String message;
  HistoryData data;

  HistoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? HistoryData.fromJason(json['data']) : null;
  }
}

class HistoryData {
  String id;
  String name;
  String phone;

  HistoryData.fromJason(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
  }
}
// }
// class HistoryModel {
//   bool status;
//   String message;
//   HistoryData data;

//   HistoryModel({this.message, this.data, this.status});

//   HistoryModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     data = json['data'] != null ? HistoryData.fromJson(json['data']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['id'] = this.data;
//     if (this.data != null) {
//       data['data'] = this.data.toJson();
//     }
//     return data;
//   }
// }

// class HistoryData {
//   String salt;
//   String password;
//   String name;
//   String phone;

//   HistoryData({this.salt, this.password, this.name, this.phone});

//   HistoryData.fromJson(Map<String, dynamic> json) {
//     salt = json['salt'];
//     password = json['password'];
//     name = json['name'];
//     phone = json['phone'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['salt'] = this.salt;
//     data['password'] = this.password;
//     data['name'] = this.name;
//     data['phone'] = this.phone;
//     return data;
//   }
// }
