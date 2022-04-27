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
  // var id;
  var service_code;
  var date;
  var price;
  recivedata.fromJson(Map<String, dynamic> json) {
    service_code = json['service_code'];
    price = json['price'];
    date = json['date'];
  }
}
