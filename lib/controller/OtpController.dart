
import 'dart:async';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:stattrack/network/apiClient.dart';
import 'package:stattrack/ui/dashBoard.dart';
import 'package:stattrack/ui/set_password.dart';
import 'package:stattrack/utils/commen.dart';

import '../model/forgotpwd_model.dart';
import '../model/otpverify_model.dart';
import '../utils/constant.dart';

class OtpController extends GetxController{


  var isOtpFilled=false.obs;
  var id="";
  var isLoading=false.obs;
  String  otp="";
  OtpFieldController ?otpFieldController;
  OtpController(this.id);
  var timer ;
  var count = "0".obs;
  double count2 = 0.1;

  var apiClient = Apiclient.instance;
  
  @override
  void onInit() {
    super.onInit();
    otpFieldController= OtpFieldController();
    startTimer();

  }
  
  void otpVerify() async {
    if(otp.length<4){
      toast("Please enter valid otp");
      return;
    }

    Map<String, dynamic> map = {
       "userId" : id,
       "otp" : otp,

    };
    try {
      isLoading.value = true;
      var data = await apiClient?.post(url: BASE_URL + "users/verifyOtp", body: map, context: Get.context!);
      var responce = OtpVerifyModel.fromJson(data);
      isLoading.value = false;
      print(responce);
      Get.to(SetPassword(id));

    } catch (e) {
    } finally {
      isLoading.value = false;
    }
  }

  void callAPIForgot(email) async {
    Map<String, dynamic> map = {
      "email": email,
    };
    try {
      isLoading.value = true;
      var data = await apiClient?.post(url: BASE_URL + "users/forgetPassword", body: map, context: Get.context!);
      var responce = ForgotPwdModel.fromJson(data);
      isLoading.value = false;
      toast(responce.message!);
    } catch (e) {
    } finally {
      isLoading.value = false;
    }
  }

  void startTimer() {

  }
}