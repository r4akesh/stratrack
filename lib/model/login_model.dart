
class LoginModel {
  LoginModel({
    required this.message,
    required this.code,
    required this.data,
  });
  late final String message;
  late final int code;
  late final Data data;

  LoginModel.fromJson(Map<String, dynamic> json){
    message = json['message'];
    code = json['code'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['code'] = code;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.token,
    required this.user,
  });
  late final String token;
  late final User user;

  Data.fromJson(Map<String, dynamic> json){
    token = json['token'];
    user = User.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['token'] = token;
    _data['user'] = user.toJson();
    return _data;
  }
}

class User {
  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.isPlanActive,
    required this.profile_image,
    required this.password,
    required this.status,
    required this.confirmationCode,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
    required this.V,
  });
  late final String id;
  late final String firstName;
  late final String lastName;
  late final String email;
  late final String isPlanActive;
  late final String profile_image;
  late final String password;
  late final String status;
  late final String confirmationCode;
  late final String role;
  late final String createdAt;
  late final String updatedAt;
  late final int V;

  User.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    isPlanActive = json['isPlanActive'];
    profile_image = json['profile_image'];
    password = json['password'];
    status = json['status'];
    confirmationCode = json['confirmationCode'];
    role = json['role'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['firstName'] = firstName;
    _data['lastName'] = lastName;
    _data['email'] = email;
    _data['isPlanActive'] = isPlanActive;
    _data['profile_image'] = profile_image;
    _data['password'] = password;
    _data['status'] = status;
    _data['confirmationCode'] = confirmationCode;
    _data['role'] = role;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['__v'] = V;
    return _data;
  }
}