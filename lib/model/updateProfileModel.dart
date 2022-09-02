class UpdateProfileModel {
  String? message;
  int? status;
  Data? data;

  UpdateProfileModel({this.message, this.status, this.data});

  UpdateProfileModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? profileImage;
  String? sId;
  String? firstName;
  String? lastName;
  String? email;
  String? isPlanActive;

  Data(
      {this.profileImage,
        this.sId,
        this.firstName,
        this.lastName,
        this.email,
        this.isPlanActive});

  Data.fromJson(Map<String, dynamic> json) {
    profileImage = json['profile_image'];
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    isPlanActive = json['isPlanActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['profile_image'] = this.profileImage;
    data['_id'] = this.sId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['isPlanActive'] = this.isPlanActive;
    return data;
  }
}