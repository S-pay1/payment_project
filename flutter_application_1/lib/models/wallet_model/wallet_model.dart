class WalletModel {
  bool status;
  String message;
  WalletData data;

  WalletModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    // data = json['data'] != null ? WalletData.fromJson(json['data']) : null;
    data = WalletData.fromJson(json['data'] as Map<String, dynamic>);
  }
}

class WalletData {
  // String id;
  // String company_name;
  // String date;
  // String total;
  List<reciveWalletdata> payments = [];
  WalletData.fromJson(Map<String, dynamic> json) {
    json['payments'].forEach((element) {
      payments.add(reciveWalletdata.fromJson(element));
    });
  }
}

class reciveWalletdata {
  String id;
  String balance;
  String client_id;

  reciveWalletdata.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    balance = json['company_name'];
    client_id = json['date'];
  }
}
