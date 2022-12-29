 


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stattrack/model/forgotpwd_model.dart';
import 'package:stattrack/ui/otp_verifaction.dart';

import '../main.dart';
import '../network/apiClient.dart';
import '../utils/commen.dart';
import '../utils/constant.dart';

class ForgotPwdController extends GetxController {
  TextEditingController? emailController;
  var isLoading = false.obs;
  final apiClient = Apiclient.instance;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
  }

  validation() {
    if (emailController!.text.toString().isEmpty||!emailController!.text.toString().isEmail) {
      toast("Enter valid email");
    } else {
      callAPI();
    }
  }
  void callAPI() async {
    Map<String, dynamic> map = {
      "email": emailController!.text.toString(),
    };
    try {
      isLoading.value = true;
      var data = await apiClient?.post(url: BASE_URL + "users/forgetPassword", body: map, context: Get.context!);
      var responce = ForgotPwdModel.fromJson(data);
      isLoading.value = false;
      toast(responce.message!);

      Get.to(OtpVerifaction(responce.data!.id,emailController!.text.toString()));
    } catch (e) {
    } finally {
      isLoading.value = false;
    }
  }
}



