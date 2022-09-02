class SubcriptionModel {
  String? message;
  int? code;
  Data? data;

  SubcriptionModel({this.message, this.code, this.data});

  SubcriptionModel.fromJson(Map<String, dynamic> json) {
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
  List<Subscriptionplans>? subscriptionplans;

  Data({this.subscriptionplans});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['subscriptionplans'] != null) {
      subscriptionplans = <Subscriptionplans>[];
      json['subscriptionplans'].forEach((v) {
        subscriptionplans!.add(new Subscriptionplans.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.subscriptionplans != null) {
      data['subscriptionplans'] =
          this.subscriptionplans!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Subscriptionplans {
  String? sId;
  String? planName;
  String? planDescription;
  int? planDurationDays;
  int? planPrice;
  String? status;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Subscriptionplans(
      {this.sId,
      this.planName,
      this.planDescription,
      this.planDurationDays,
      this.planPrice,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Subscriptionplans.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    planName = json['planName'];
    planDescription = json['planDescription'];
    planDurationDays = json['planDurationDays'];
    planPrice = json['planPrice'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['planName'] = this.planName;
    data['planDescription'] = this.planDescription;
    data['planDurationDays'] = this.planDurationDays;
    data['planPrice'] = this.planPrice;
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
