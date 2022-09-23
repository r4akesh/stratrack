import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stattrack/controller/loginController.dart';
import 'package:stattrack/ui/changePassword.dart';
import 'package:stattrack/ui/dashBoard.dart';
import 'package:stattrack/ui/forgoPassword.dart';
import 'package:stattrack/ui/payment_screen.dart';
import 'package:stattrack/ui/signup.dart';

import 'package:stattrack/utils/colors.dart';
import 'package:stattrack/utils/constant.dart';
import 'package:stattrack/utils/string.dart';

import '../utils/commen.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.put(LoginController());

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
                  onTap: () {
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
                Obx(() => Column(
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
                        appText(welcomeBack,fontSize: 22, fontweight: FontWeight.w600),
                        const SizedBox(
                          height: 40,
                        ),
                        appTextField(emailAddress,
                            controller: loginController.emailEditController,hint: "Enter the email address"),
                        const SizedBox(
                          height: 30,
                        ),
                        appTextFieldPassword(password, loginController.isPasswordShow.value, loginController,
                            controller: loginController.passwordEditController,
                          hint : "Enter the password",
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Align(
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                              onTap: () {
                                Get.to(const ForgotPassword());
                              },
                              child: appText(forgotPassword,
                                  txtColor: appBlue,
                                  fontweight: FontWeight.w400,
                                  isUnderline: true),
                            )),
                        const SizedBox(
                          height: 50,
                        ),
                        GestureDetector(
                            onTap: () {
                              loginController.validation();
                            },
                            child: Stack(
                              children: [
                                Visibility(
                                  child:
                                      appButton(context, signIn, 60, appOrange),
                                  maintainState: true,
                                  maintainSize: true,
                                  maintainAnimation: true,
                                  visible: !loginController.isLoading.value,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  alignment: Alignment.center,
                                  child: Visibility(
                                    child:   const CircularProgressIndicator(
                                      valueColor:   AlwaysStoppedAnimation<Color>(appOrange),

                                    ),
                                    maintainState: true,
                                    maintainSize: true,
                                    maintainAnimation: true,
                                    visible: loginController.isLoading.value,
                                  ),
                                ),
                              ],
                            )),
                        const SizedBox(
                          height: 200,
                        ),
                        Container(
                          alignment: Alignment.bottomCenter,
                          child: RichText(
                            text: TextSpan(
                              text: dontHaveAccount,
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 16),
                              children: <TextSpan>[
                                TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Get.to(const Signup());
                                      },
                                    text: signUp,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        color: appBlue)),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        )
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


Widget appTextFieldPassword(String lable, bool obsecure, LoginController getxcontroller,
    {TextEditingController? controller,String hint ="" }) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      appText(lable),
      TextField(
        controller: controller,
        cursorColor: appBlack,
        maxLines: 1,
        obscureText: !obsecure,
        style: const TextStyle(color: Colors.grey, fontSize: 16),
        decoration: InputDecoration(
          hintStyle: const TextStyle(fontSize: 14),
          hintText: hint,
          suffixIcon:  GestureDetector(onTap: (){
            getxcontroller.isPasswordShow.value =!getxcontroller.isPasswordShow.value;
          },
          child:  getxcontroller.isPasswordShow.value?const Icon(Icons.visibility,color: Colors.grey,):const Icon(Icons.visibility_off,color: Colors.grey,),),
          labelStyle:
          const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          border: const UnderlineInputBorder(
            borderSide: BorderSide(color: appLightBlue),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: appLightBlue),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: appLightBlue),
          ),
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: appLightBlue),
          ),
          disabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: appLightBlue),
          ),
        ),
      ),
    ],
  );
}