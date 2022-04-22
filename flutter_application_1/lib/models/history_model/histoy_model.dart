class HistoryModel {
  bool status;
  String message;
  HistoryData data;

  HistoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    // data = json['data'] != null ? HistoryData.fromJson(json['data']) : null;
    data = HistoryData.fromJson(json['data'] as Map<String, dynamic>);
  }
}

class HistoryData {
  // String id;
  // String company_name;
  // String date;
  // String total;
  List<recivedata> payments = [];
  HistoryData.fromJson(Map<String, dynamic> json) {
    json['payments'].forEach((element) {
      payments.add(recivedata.fromJson(element));
    });
  }
}

class recivedata {
  String id;
  String company_name;
  String date;
  String total;
  recivedata.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    company_name = json['company_name'];
    date = json['date'];
    total = json['total'].toString();
  }
}
