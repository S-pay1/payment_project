import 'dart:convert';

class PayModel {
  bool status;
  String message;
  // SendWalletdata data;

  PayModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'].toString();
    // data = SendWalletdata.fromJson(json['data']);
    // data = json['data'] != null
    //     ? SendWalletdata.fromJson(jsonDecode(json['data']))
    //     : null;
    // data: User.fromJson(json.decode(json['data'])),
  }
}

// class SendWalletdata {
//   String client_id;

//   SendWalletdata.fromJson(Map<String, dynamic> json) {
//     client_id = json['client_id'];
//   }
// }
