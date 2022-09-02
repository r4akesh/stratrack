import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stattrack/model/otpverify_model.dart';
import 'package:stattrack/network/apiClient.dart';

import '../ui/login.dart';
import '../utils/commen.dart';
import '../utils/constant.dart';

class SetPasswordController extends GetxController {
  var isPasswordShow = false.obs;
  var isConfirmPasswordShow = false.obs;
  var isLoading = false.obs;
  var userID;
  TextEditingController? pwdEditController;
  TextEditingController? pwdcConfirmEditController;

  SetPasswordController(this.userID);

  final apiClient = Apiclient.instance;

  @override
  void onInit() {
    super.onInit();
    pwdEditController = TextEditingController();
    pwdcConfirmEditController = TextEditingController();
  }

  isValidation() {
    if (pwdEditController!.text.toString().isEmpty) {
      toast("Please enter the valid password");
      return false;
    } else if (pwdcConfirmEditController!.text.toString().isEmpty) {
      toast("Please enter the valid confirm password");
      return false;
    } else if (pwdcConfirmEditController!.text.toString() != pwdEditController!.text.toString()) {
      toast("Password should be same with confirm password");
      return false;
    }
    return true;
  }

  callSetPwdApi() async {
    if (isValidation()) {
      Map<String, dynamic> map = {
        "newPassword": pwdEditController!.text.toString(),
        "id": userID,
      };
      try {
        isLoading.value = true;
        var data = await apiClient?.post(
            url: BASE_URL + "users/resetPassword", body: map, context: Get.context!);

        var responce = OtpVerifyModel.fromJson(data);

        isLoading.value = false;
        print(responce);
        toast(responce.message!);


        Get.offAll(Login());

      } finally {
        isLoading.value = false;
      }
    }
  }
}
