
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stattrack/controller/signUpController.dart';
import 'package:stattrack/ui/login.dart';

import '../controller/loginController.dart';
import '../utils/colors.dart';
import '../utils/commen.dart';
import '../utils/constant.dart';
import '../utils/string.dart';
import 'cmspage.dart';

class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpController signUpController =Get.put(SignUpController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            width: MediaQuery.of(context).size.width,
            child:  Obx(()=>Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25, left: 0),
                  child: GestureDetector(
                    onTap: (){Get.back();},
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
                    appText(createAccount,fontSize: 22, fontweight: FontWeight.w600),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(children: [
                      Expanded(child: appTextField(firstName,controller: signUpController.firstNameEditController,hint: "Enter first name")),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(child: appTextField(lastName,controller: signUpController.lastNameEditController,hint: "Enter last name")),
                    ],),
                    const SizedBox(
                      height: 15,
                    ),
                    appTextField(emailAddress,controller: signUpController.emailEditController,hint: "Enter the email address"),
                    const SizedBox(
                      height: 15,
                    ),

                    appTextFieldPassword(
                      password,
                      signUpController.isPasswordShow.value,
                      signUpController,
                      controller: signUpController.passwordEditController,
                      hint: "Enter the password"
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    appTextFieldPassword2(
                      confirmPassword,
                      signUpController.isConPasswordShow.value,
                      signUpController,
                      controller: signUpController.CnfpasswordEditController,
                        hint: "Enter the confirm password"
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: const EdgeInsets.only( top: 10,left: 0),
                      child: Row(
                        children: [
                          Checkbox(
                            value: signUpController.isCheckBox.value,
                            onChanged: (value) {
                              signUpController.isCheckBox.value =value!;
                            },
                            // Background color of your checkbox if selected
                            activeColor: appBlue,
                            // Color of your check mark

                            shape:   RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            side: const BorderSide(
                              color: Colors.grey,
                              // Give your checkbox border a custom width
                              width: 1.5,
                            ),
                          ),
                          const SizedBox(height: 15,),
                          RichText(
                            text: TextSpan(
                              text: iAgree,
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 14),
                              children: <TextSpan>[
                                TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Get.to(CmsPage( topTitle: PrivacyPolicy,));

                                      },
                                    text: termOfServices,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        decoration: TextDecoration.underline,
                                        fontSize: 14,
                                        color: appBlue)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20,),
                    GestureDetector(onTap:(){
                      signUpController.validation();
                    },child:   Stack(
                      children: [
                        Visibility(
                          child:
                          appButton(context, signUp, 60, appOrange),
                          maintainState: true,
                          maintainSize: true,
                          maintainAnimation: true,
                          visible: !signUpController.isLoading.value,
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
                            visible: signUpController.isLoading.value,
                          ),
                        ),
                      ],
                    )),
                    const SizedBox(height: 40,),
                    Container(
                      alignment: Alignment.bottomCenter,
                      child: RichText(
                        text: TextSpan(
                          text: alreadyHaveAccount,
                          style:
                          const TextStyle(color: Colors.grey, fontSize: 16),
                          children: <TextSpan>[
                            TextSpan(
                                recognizer: TapGestureRecognizer()..onTap = () {

                                //  Get.back();
                                  Get.off(const Login());

                                },
                                text: logIn,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: appBlue)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30,),

                  ],
                ),
              ],
            ),)
          ),
        ),
      ),
    );
  }
}

Widget appTextFieldPassword(String lable, bool obsecure, SignUpController getxcontroller,
    {TextEditingController? controller,String hint="" }) {
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
          hintText: hint,
          hintStyle: TextStyle(fontSize: 14),
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

Widget appTextFieldPassword2(String lable, bool obsecure, SignUpController getxcontroller,
    {TextEditingController? controller,String hint="" }) {
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
          hintText: hint,
          hintStyle: TextStyle(fontSize: 14),
          suffixIcon:  GestureDetector(onTap: (){
            getxcontroller.isConPasswordShow.value =!getxcontroller.isConPasswordShow.value;
          },
            child:  getxcontroller.isConPasswordShow.value?const Icon(Icons.visibility,color: Colors.grey,):const Icon(Icons.visibility_off,color: Colors.grey,),),
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
