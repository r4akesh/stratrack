import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:stattrack/controller/activeplan_controller.dart';
import 'package:stattrack/utils/LoadingWidget.dart';

import '../utils/colors.dart';
import '../utils/commen.dart';
import '../utils/constant.dart';

class ActivePlanScreen extends StatelessWidget {
  const ActivePlanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(DateTime.now().millisecondsSinceEpoch);
    print(DateTime.now().millisecond);

    return GetX<ActivePlanController>(
        init: ActivePlanController(),
        builder: (controller) {
          return controller.isLoading.value
              ? LoadingWidget()
              : Card(
                  margin: const EdgeInsets.only(
                      top: 20, left: 20, right: 20, bottom: 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Container(
                        height: 30,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: const BoxDecoration(
                            color: applightBlueGrey,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                topLeft: Radius.circular(10))),
                        //  child: appText( "Start date${controller.subscriptionDataNew.value[0].subscriptionStartdate ?? ""}",
                        child: appText(
                            "From :  ${dateToStr(controller.subscriptionDataNew.value[0].subscriptionStartdate)}",
                            txtColor: Colors.black54,
                            fontweight: FontWeight.w300,
                            fontSize: 14),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 8),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  forwordIcon,
                                  scale: 3,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                  child: appText(
                                      controller.subscriptionDataNew.value[0]
                                              .planName?[0] ??
                                          "",
                                      fontweight: FontWeight.w400,
                                      fontSize: 18),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 0,
                                ),
                                Flexible(
                                  child: appText(
                                      controller.subscriptionDataNew.value[0]
                                              .planDescription?[0] ??
                                          "",
                                      fontweight: FontWeight.w400,
                                      fontSize: 15),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 40,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            color: appTextGrey,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10))),
                        child: appText(
                            "Will be expired on :  ${dateToStr(controller.subscriptionDataNew.value[0].subscriptionEnddate)}",
                            txtColor: Colors.white,
                            fontweight: FontWeight.w400,
                            fontSize: 14),
                      )
                    ],
                  ),
                );
        });
  }

  String dateToStr(DateTime? dt) {
    final DateFormat formatter = DateFormat("EEE, MMMM, dd, yyyy");
    final String formatted = formatter.format(dt!);

    return formatted;
  }
}
