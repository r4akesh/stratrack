import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stattrack/ui/login.dart';
import 'package:stattrack/ui/signup.dart';
import 'package:stattrack/utils/colors.dart';
import 'package:stattrack/utils/commen.dart';
import 'package:stattrack/utils/constant.dart';
import 'package:stattrack/utils/string.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image.asset(
                welcomeBg,
                fit: BoxFit.fill,
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*0.4,),
              Center(
                  child: Image.asset(
                appLogo,
                scale: 3.5,
              )),
              const SizedBox(
                height: 25,
              ),
              GestureDetector(
                onTap: (){
                  Get.off(const Signup());
                },
                child: appButton(
                  context,
                  signUp,
                  50,
                  appOrange,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              GestureDetector(
                onTap: (){
                  Get.off(const Login());
                },
                child: appButton(
                  context,
                  signIn,
                  50,
                  appBlue,
                ),
              ),

              const SizedBox(height: 100,)
            ],
          )

        ],
      ),
    );
  }
}
