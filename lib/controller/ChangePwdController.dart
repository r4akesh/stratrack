import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stattrack/main.dart';

import 'package:stattrack/network/apiClient.dart';

import '../model/otpverify_model.dart';
import '../utils/commen.dart';
import '../utils/constant.dart';

class ChangePwdController extends GetxController {
  var isPasswordShow = true.obs;
  var isConfirmPasswordShow = true.obs;
  var isLoading = false.obs;

  TextEditingController? pwdEditController;
  TextEditingController? pwdConfirmEditController;
  TextEditingController? pwdOldEditController;

  final apiClient = Apiclient.instance;

  //final apiClient = ApiServiceNew.instance;

  @override
  void onInit() {
    super.onInit();
    pwdEditController = TextEditingController();
    pwdConfirmEditController = TextEditingController();
    pwdOldEditController = TextEditingController();
  }

  isValidation() {
    if (pwdOldEditController!.text.toString().isEmpty) {
      toast("Please enter the valid old password");
      return false;
    } else if (pwdEditController!.text.toString().isEmpty) {
      toast("Please enter the valid new password");
      return false;
    } else if (pwdConfirmEditController!.text.toString().isEmpty) {
      toast("Please enter the valid confirm password");
      return false;
    } else if (pwdConfirmEditController!.text.toString() !=
        pwdEditController!.text.toString()) {
      toast("Password should be same with confirm password");
      return false;
    }
    return true;
  }

  callApiChngPwd() async {
    if (isValidation()) {
      Map<String, dynamic> map = {
        "password": pwdOldEditController!.text.toString(),
        "newpassword": pwdEditController!.text.toString(),
        "userId": MyApp.box.read("id"),
      };
      try {
        isLoading.value = true;
        var data = await apiClient?.post(
            url: BASE_URL + "users/changePassword",
            body: map,
            context: Get.context!);
        print("Request www=> $data");
        var responce = OtpVerifyModel.fromJson(data);

        isLoading.value = false;
        //   print(responce);
        toast(responce.message!);

        Get.back();
      } finally {
        isLoading.value = false;
      }
    }
  }
}
