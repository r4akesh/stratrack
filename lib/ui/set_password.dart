import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stattrack/controller/setPasswordController.dart';

import '../controller/signUpController.dart';
import '../utils/colors.dart';
import '../utils/commen.dart';
import '../utils/constant.dart';
import '../utils/string.dart';

class SetPassword extends StatelessWidget {
  var id;

  SetPassword(this.id, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SetPasswordController setPasswordController =Get.put(SetPasswordController(id));
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            width: MediaQuery.of(context).size.width,
            child: Stack(
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
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Obx(()=> Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 50,),
                      Image.asset(
                        appLogo,
                        scale: 4.5,
                      ),
                      const SizedBox(height: 20,),
                      appText("Set password",fontSize: 20,fontweight: FontWeight.w600),
                      const SizedBox(height: 50,),
                      appTextFieldPassword("Password",  setPasswordController,hint: "Enter the password",controller: setPasswordController.pwdEditController),
                      const SizedBox(height: 30,),
                      appTextField2Password("Confirm password", setPasswordController,controller:setPasswordController.pwdcConfirmEditController,hint: "Enter the confirm password"),
                      const SizedBox(height: 50,),
                      GestureDetector(onTap:(){
                        setPasswordController.callSetPwdApi();
                      },child: Obx(()=>setPasswordController.isLoading.value?CircularProgressIndicator():appButton(context, "Submit", 60, appOrange)))

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

Widget appTextFieldPassword(String lable,  SetPasswordController getxcontroller,
    {TextEditingController? controller,String hint="" }) {
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

Widget appTextField2Password(String lable,   SetPasswordController getxcontroller,
    {TextEditingController? controller,String hint="" }) {
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
          suffixIcon:  GestureDetector(onTap: (){
            getxcontroller.isConfirmPasswordShow.value =!getxcontroller.isConfirmPasswordShow.value;
          },
            child:  getxcontroller.isConfirmPasswordShow.value?const Icon(Icons.visibility,color: Colors.grey,):const Icon(Icons.visibility_off,color: Colors.grey,),),
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
