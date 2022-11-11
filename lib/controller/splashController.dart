import 'dart:async';

import 'package:get/get.dart';
import 'package:stattrack/main.dart';
import 'package:stattrack/ui/dashBoard.dart';
import 'package:stattrack/ui/login.dart';
import 'package:stattrack/ui/payment_screen.dart';
import 'package:stattrack/ui/selectMatch.dart';
import 'package:stattrack/ui/welcome.dart';
import 'package:stattrack/utils/constant.dart';

import '../ui/subscription.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: 3), () async {
      goToNext();
    });
  }

  void goToNext() {
    print("IS_SUBSCRIBE>>");
    if (MyApp.box.read("id") != null) {
      print("IS_SUBSCRIBE>>${MyApp.box.read(IS_SUBSCRIBE)}");
      if (MyApp.box.read(IS_SUBSCRIBE)) {
        Get.off(() => Dashboard());
      } else {
        Get.off(() => Subscription());
      }
    } else {
      Get.off(() => Welcome());
    }

    // MyApp.box.read("id") != null?Timer(const Duration(seconds: 3), () => Get.off(() =>   Dashboard())):Timer(const Duration(seconds: 3), () => Get.off(() => const Welcome()));
    // MyApp.box.read("id") != null?Timer(const Duration(seconds: 3), () => Get.offAll(() =>   Login())):Timer(const Duration(seconds: 3), () => Get.offAll(() => const Login()));
    // MyApp.box.read("id") != null
    //     ? Timer(const Duration(seconds: 3), () => Get.off(() => Subscription()))
    //     : Timer(const Duration(seconds: 3),
    //         () => Get.off(() => const Subscription()));
  }
}
