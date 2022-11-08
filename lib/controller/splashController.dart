import 'dart:async';

import 'package:get/get.dart';
import 'package:stattrack/main.dart';
import 'package:stattrack/ui/dashBoard.dart';
import 'package:stattrack/ui/login.dart';
import 'package:stattrack/ui/payment_screen.dart';
import 'package:stattrack/ui/selectMatch.dart';
import 'package:stattrack/ui/welcome.dart';

import '../ui/PaymentChkoutScreen.dart';
import '../ui/subscription.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();

    goToNext();
  }

  void goToNext() {
    //MyApp.box.read("id") != null?Timer(const Duration(seconds: 3), () => Get.off(() =>   Dashboard())):Timer(const Duration(seconds: 3), () => Get.off(() => const Welcome()));
    MyApp.box.read("id") != null?Timer(const Duration(seconds: 3), () => Get.off(() =>   Login())):Timer(const Duration(seconds: 3), () => Get.off(() => const Login()));
    // MyApp.box.read("id") != null
    //     ? Timer(const Duration(seconds: 3), () => Get.off(() => Subscription()))
    //     : Timer(const Duration(seconds: 3),
    //         () => Get.off(() => const Subscription()));
  }
}
