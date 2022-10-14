import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:stattrack/controller/OtpController.dart';
import 'package:stattrack/utils/timer_count.dart';

import '../utils/colors.dart';
import '../utils/commen.dart';
import '../utils/constant.dart';
import '../utils/string.dart';

class OtpVerifaction extends StatelessWidget {
  var id;
  var email;

  OtpVerifaction(this.id, this.email, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OtpController otpController = Get.put(OtpController(id));
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.95,
            margin: const EdgeInsets.only(left: 20, right: 20),
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25, left: 0),
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Image.asset(
                      backIcon,
                      scale: 3,
                    ),
                  ),
                ),
                Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 50,
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
                      appText("OTP Verification", fontSize: 20),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: OTPTextField(
                          controller: otpController.otpFieldController,
                          onCompleted: (value) {
                            otpController.otp = value;
                            otpController.otpVerify();
                          },
                          onChanged: (value) {
                            otpController.otp = value.toString();
                          },
                          length: 4,
                          fieldStyle: FieldStyle.box,
                          fieldWidth: 65,
                          contentPadding: EdgeInsets.all(25),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TimeCounderProgressBar(),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      GestureDetector(
                          onTap: () {
                            otpController.otpVerify();
                          },
                          child: otpController.isLoading.value
                              ? CircularProgressIndicator()
                              : appButton(context, "Verify", 60, appOrange)),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              width: MediaQuery.of(context).size.width,
                              alignment: Alignment.centerLeft,
                              color: appOrangeTrans,
                              child: RichText(
                                text: TextSpan(
                                    text: "Didn't receive the OTP??",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: " Resend",
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            //addddd
                                            otpController.callAPIForgot(email);
                                          },
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: appBlue2,
                                            fontSize: 15),
                                      )
                                    ]),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
