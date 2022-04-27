class CompanyHistoryModel {
  bool status;
  var message;
  CompanyHistoryData data;

  CompanyHistoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    // data = json['data'] != null ? HistoryData.fromJson(json['data']) : null;
    data = CompanyHistoryData.fromJson(json['data'] as Map<String, dynamic>);
  }
}

class CompanyHistoryData {
  // var id;
  // var company_name;
  // var date;
  // var total;
  List<recivedata> payments = [];
  CompanyHistoryData.fromJson(Map<String, dynamic> json) {
    json['payments'].forEach((element) {
      payments.add(recivedata.fromJson(element));
    });
  }
}

class recivedata {
  var id;
  var company_name;
  var date;
  var total;
  recivedata.fromJson(Map<String, dynamic> json) {
    id = json['id'].tovar();
    company_name = json['company_name'];
    date = json['date'];
    total = json['total'];
  }
}
