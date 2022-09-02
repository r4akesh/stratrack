import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/ChangePwdController.dart';
import '../utils/colors.dart';
import '../utils/commen.dart';
import '../utils/constant.dart';

class ChangePassword extends StatelessWidget {
    ChangePassword({  Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    ChangePwdController changePwdController = Get.put(ChangePwdController());
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
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Obx(()=> Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Image.asset(
                        appLogo,
                        scale: 4.5,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      appText("Change password",
                          fontSize: 20, fontweight: FontWeight.w600),
                      const SizedBox(
                        height: 50,
                      ),
                      appTextField3Password("Old Password", changePwdController,
                          hint: "Enter the password",
                          controller: changePwdController.pwdOldEditController),
                      const SizedBox(
                        height: 30,
                      ),
                      appTextFieldPassword("Password", changePwdController,
                          hint: "Enter the password",
                          controller: changePwdController.pwdEditController),
                      const SizedBox(
                        height: 30,
                      ),
                      appTextField2Password(
                          "Confirm password", changePwdController,
                          controller:
                              changePwdController.pwdConfirmEditController,
                          hint: "Enter the confirm password"),
                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                          onTap: () {
                            changePwdController.callApiChngPwd();
                          },
                          child: appButton(context, "Save", 60, appOrange))
                    ],
                  )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget appTextFieldPassword(String lable, ChangePwdController getxcontroller,
    {TextEditingController? controller, String hint = ""}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      appText(lable),
      TextField(
        controller: controller,
        cursorColor: appBlack,
        maxLines: 1,
        obscureText: getxcontroller.isPasswordShow.value,
        style: const TextStyle(color: Colors.grey, fontSize: 16),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(fontSize: 14),
          suffixIcon: GestureDetector(
            onTap: () {
              getxcontroller.isPasswordShow.value =
                  !getxcontroller.isPasswordShow.value;
            },
            child: getxcontroller.isPasswordShow.value
                ? const Icon(
                    Icons.visibility,
                    color: Colors.grey,
                  )
                : const Icon(
                    Icons.visibility_off,
                    color: Colors.grey,
                  ),
          ),
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

Widget appTextField2Password(String lable, ChangePwdController getxcontroller,
    {TextEditingController? controller, String hint = ""}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      appText(lable),
      TextField(
        controller: controller,
        cursorColor: appBlack,
        maxLines: 1,
        obscureText: getxcontroller.isConfirmPasswordShow.value,
        style: const TextStyle(color: Colors.grey, fontSize: 16),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(fontSize: 14),
          suffixIcon: GestureDetector(
            onTap: () {
              getxcontroller.isConfirmPasswordShow.value =
                  !getxcontroller.isConfirmPasswordShow.value;
            },
            child: getxcontroller.isConfirmPasswordShow.value
                ? const Icon(
                    Icons.visibility,
                    color: Colors.grey,
                  )
                : const Icon(
                    Icons.visibility_off,
                    color: Colors.grey,
                  ),
          ),
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

Widget appTextField3Password(String lable, ChangePwdController getxcontroller,
    {TextEditingController? controller, String hint = ""}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      appText(lable),
      TextField(
        controller: controller,
        cursorColor: appBlack,
        maxLines: 1,
        obscureText: getxcontroller.isConfirmPasswordShow.value,
        style: const TextStyle(color: Colors.grey, fontSize: 16),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(fontSize: 14),
          suffixIcon: GestureDetector(
            onTap: () {
              getxcontroller.isConfirmPasswordShow.value =
              !getxcontroller.isConfirmPasswordShow.value;
            },
            child: getxcontroller.isConfirmPasswordShow.value
                ? const Icon(
              Icons.visibility,
              color: Colors.grey,
            )
                : const Icon(
              Icons.visibility_off,
              color: Colors.grey,
            ),
          ),
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
