import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stattrack/ui/dashBoard.dart';
import 'package:stattrack/utils/colors.dart';
import 'package:stattrack/utils/commen.dart';
import 'package:stattrack/utils/constant.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(child: Image.asset(backgroundIconPayment)),
          Center(
              child: Image.asset(
            paytmCircleIcon,
            scale: 2,
          )),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                appText("Payment Successful", fontSize: 22),
                const SizedBox(
                  height: 420,
                ),
                Center(
                    child: appText("Thanks for Initiating the Payments!",
                        fontSize: 22, textAlign: TextAlign.center)),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                    onTap: () {
                      Get.offAll(Dashboard());
                    },
                    child: appButton(context, "Continue", 60, appOrange))
              ],
            ),
          )
        ],
      ),
    );
  }
}
