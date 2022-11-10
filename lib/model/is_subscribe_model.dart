class IsSubsscribeModel {
  String? message;
  int? code;
  Data? data;

  IsSubsscribeModel({this.message, this.code, this.data});

  IsSubsscribeModel.fromJson(Map<String, dynamic> json) {
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
  
  bool? isPlanActive;

  Data({ this.isPlanActive});

  Data.fromJson(Map<String, dynamic> json) {
   
    isPlanActive = json['isPlanActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    
    data['isPlanActive'] = this.isPlanActive;
    return data;
  }
}
