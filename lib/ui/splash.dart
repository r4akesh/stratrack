import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stattrack/controller/splashController.dart';
import 'package:stattrack/utils/constant.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SplashController splashController = Get.put(SplashController());
    return Scaffold(

    body: Image.asset(splashBg,fit: BoxFit.fill,),
    );
  }
}
