class CommonModel {
  String? message;
  int? code;
  Data? data;

  CommonModel({this.message, this.code, this.data});

  CommonModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? type;
  //bool? isPlanActive;

  Data({this.type});

  Data.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
   
    return data;
  }
}
