import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stattrack/controller/forgotpwdController.dart';
import 'package:stattrack/ui/set_password.dart';

import '../utils/colors.dart';
import '../utils/commen.dart';
import '../utils/constant.dart';
import '../utils/string.dart';
import 'otp_verifaction.dart';
import 'signup.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ForgotPwdController forgotPwdController = Get.put(ForgotPwdController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                GestureDetector(
                  onTap: (){
                    Get.back();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 25, left: 0),
                    child: Image.asset(
                      backIcon,
                      scale: 3,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 35,
                    ),
                    Container(
                        alignment: Alignment.topCenter,
                        child: Image.asset(
                          appLogo,
                          scale: 4.5,
                        )),
                    const SizedBox(
                      height: 50,
                    ),
                    appText(forgotPassword2,fontSize: 22, fontweight: FontWeight.w600),
                    const SizedBox(
                      height: 40,
                    ),
                    appTextField(emailAddress,controller: forgotPwdController.emailController, hint: "Enter the email address"),
                    const SizedBox(
                      height: 40,
                    ),
                    GestureDetector(onTap:(){
                      forgotPwdController.validation();
                    },child: Obx(()=>forgotPwdController.isLoading.value?CircularProgressIndicator():appButton(context, submit, 60, appOrange))),

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
