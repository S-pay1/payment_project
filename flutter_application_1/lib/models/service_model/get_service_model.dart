class DataModel {
  bool status;
  String message;
  DataData data;

  DataModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];

    data = DataData.fromJson(json['data'] as Map<String, dynamic>);
  }
}

class DataData {
  List itemsOfDropDown = [];
  List<getdata> companies = [];
  DataData.fromJson(Map<String, dynamic> json) {
    json['companies'].forEach((element) {
      companies.add(getdata.fromJson(element));
    });
    // json['companies'].forEach((element) {
    //   itemsOfDropDown.add(getdata.fromJson(element));
    // });
  }
}

class getdata {
  String id;
  String name;

  getdata.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
