class WalletModel {
  bool status;
  String message;
  reciveWalletdata data;

  WalletModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    // data = json['data'] != null ? WalletData.fromJson(json['data']) : null;
    data = reciveWalletdata.fromJson(json['data'] as Map<String, dynamic>);
  }
}

// class WalletData {
//   List<reciveWalletdata> payments = [];
//   WalletData.fromJson(Map<String, dynamic> json) {
//     json['payments'].forEach((element) {
//       payments.add(reciveWalletdata.fromJson(element));
//     });
//   }
// }

class reciveWalletdata {
  var id;
  var balance;
  // String client_id;

  reciveWalletdata.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    balance = json['balance'];
    // client_id = json['date'];
  }
}
