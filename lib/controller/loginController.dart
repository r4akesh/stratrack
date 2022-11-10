import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:stattrack/main.dart';
import 'package:stattrack/model/login_model.dart';
import 'package:stattrack/network/apiClient.dart';
import 'package:stattrack/ui/subscription.dart';
import 'package:stattrack/utils/commen.dart';

import '../ui/dashBoard.dart';
import '../utils/constant.dart';

class LoginController extends GetxController {
  var isEmailValid = false.obs;
  var isPasswordValid = false.obs;
  var isLoading = false.obs;
  var isPasswordShow = false.obs;

  TextEditingController? emailEditController;
  TextEditingController? passwordEditController;

  final apiClient = Apiclient.instance;

  @override
  void onInit() {
    super.onInit();
    emailEditController = TextEditingController();
    passwordEditController = TextEditingController();
  }


  void validation() {
    emailEditController!.text.toString().isNotEmpty
        ? isEmail(emailEditController!.text.toString())
            ? passwordEditController!.text.toString().isNotEmpty
                ? callLoginApi()
                : toast("Enter valid password")
            : toast("Enter valid email")
        : toast("Enter valid email");
  }

  callLoginApi() async {
    Map<String, dynamic> map = {
      "email": emailEditController!.text.toString().toLowerCase(),
      "password": passwordEditController!.text.toString(),
    };
    print("1");
    try{
      isLoading.value =true;
      var data = await apiClient?.post(url: BASE_URL + "users/userLogin", body: map, context: Get.context!);
      var responce = LoginModel.fromJson(data);
      isLoading.value =false;
      MyApp.box.write("token", ""+responce.data.token);
      MyApp.box.write("id", ""+responce.data.user.id);
      MyApp.box.write("firstName", ""+responce.data.user.firstName);
      MyApp.box.write("lastName", ""+responce.data.user.lastName);
      MyApp.box.write("email", ""+responce.data.user.email);
      MyApp.box.write("imageUrl", ""+responce.data.user.profile_image);
      MyApp.box.write(IS_SUBSCRIBE, false);    
      Get.offAll(Subscription());
      //Get.off(Dashboard());
    }catch(e){
      print("catch login>>$e");
    }
    finally { isLoading.value =false;}
  }
}
