import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stattrack/ui/dashBoard.dart';
import 'package:stattrack/ui/login.dart';
import 'package:stattrack/ui/otp_verifaction.dart';
import 'package:stattrack/utils/commen.dart';

import '../main.dart';
import '../model/login_model.dart';
import '../network/apiClient.dart';
import '../utils/constant.dart';

class SignUpController extends GetxController {
  var isEmailValid = false.obs;
  var isPasswordValid = false.obs;
  var isFirstNameValid = false.obs;
  var isLastNameValid = false.obs;

  var isLoading = false.obs;
  var isPasswordShow = false.obs;
  var isConPasswordShow = false.obs;
  var isCheckBox = false.obs;

  TextEditingController? emailEditController;
  TextEditingController? passwordEditController;
  TextEditingController? CnfpasswordEditController;
  TextEditingController? firstNameEditController;
  TextEditingController? lastNameEditController;
  final apiClient = Apiclient.instance;

  @override
  void onInit() {
    super.onInit();
    emailEditController = TextEditingController();
    passwordEditController = TextEditingController();
    CnfpasswordEditController = TextEditingController();
    firstNameEditController = TextEditingController();
    lastNameEditController = TextEditingController();
  }

  void validation() {
    if (firstNameEditController!.text.isNotEmpty && firstNameEditController!.text.toString().trim().length>0) {
      if (lastNameEditController!.text.isNotEmpty && lastNameEditController!.text.toString().trim().length>0) {
        if (emailEditController!.text.isNotEmpty &&
            emailEditController!.text.isEmail) {
          if (passwordEditController!.text.isNotEmpty) {
            if (CnfpasswordEditController!.text.isNotEmpty) {
              if (passwordEditController!.text.toString() ==
                  CnfpasswordEditController!.text.toString()) {
                if (isCheckBox.value) {
                  callSignupApi();
                } else {
                  toast("Please accept term and services");
                }
              } else {
                toast("Password and  confirm password should be same");
              }
            } else {
              toast("Please enter confirm password");
            }
          } else {
            toast("Please enter password");
          }
        } else {
          toast("Please enter valid email");
        }
      } else {
        toast("Please enter last name");
      }
    } else {
      toast("Please enter first name");
    }
  }

  callSignupApi() async {

    Map<String, dynamic> map = {
      "email": emailEditController!.text.toString(),
      "password": passwordEditController!.text.toString(),
      "confPassword": CnfpasswordEditController!.text.toString(),
      "firstName": firstNameEditController!.text.toString(),
      "lastName": lastNameEditController!.text.toString(),
    };
    try {
      isLoading.value = true;
      var data = await apiClient?.post(
          url: BASE_URL + "users/register", body: map, context: Get.context!);

      var responce = LoginModel.fromJson(data);
      isLoading.value = false;
      print(responce);
      toast(responce.message);
      Get.offAll(const Login());
    } finally {
      isLoading.value = false;
    }
  }
}
