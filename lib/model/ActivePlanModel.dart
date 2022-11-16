class ActivePlanModel {
  String? message;
  int? code;
  Data? data;

  ActivePlanModel({this.message, this.code, this.data});

  ActivePlanModel.fromJson(Map<String, dynamic> json) {
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
  List<SubscriptionPlans>? subscriptionPlans;

  Data({this.subscriptionPlans});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['subscriptionPlans'] != null) {
      subscriptionPlans = <SubscriptionPlans>[];
      json['subscriptionPlans'].forEach((v) {
        subscriptionPlans!.add(new SubscriptionPlans.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.subscriptionPlans != null) {
      data['subscriptionPlans'] =
          this.subscriptionPlans!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubscriptionPlans {
  String? sId;
  DateTime? subscriptionStartdate;
  DateTime? subscriptionEnddate;
  String? status;
  List<String>? planName;
  List<String>? planDescription;
  List<int>? planDurationDays;
  List<int>? planPrice;

  SubscriptionPlans(
      {this.sId,
      this.subscriptionStartdate,
      this.subscriptionEnddate,
      this.status,
      this.planName,
      this.planDescription,
      this.planDurationDays,
      this.planPrice});

  SubscriptionPlans.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    subscriptionStartdate = DateTime.parse(json['subscription_startdate']);
    subscriptionEnddate = DateTime.parse(json['subscription_enddate']);
    status = json['status'];
    planName = json['planName'].cast<String>();
    planDescription = json['planDescription'].cast<String>();
    planDurationDays = json['planDurationDays'].cast<int>();
    planPrice = json['planPrice'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['subscription_startdate'] = this.subscriptionStartdate;
    data['subscription_enddate'] = this.subscriptionEnddate;
    data['status'] = this.status;
    data['planName'] = this.planName;
    data['planDescription'] = this.planDescription;
    data['planDurationDays'] = this.planDurationDays;
    data['planPrice'] = this.planPrice;
    return data;
  }
}
