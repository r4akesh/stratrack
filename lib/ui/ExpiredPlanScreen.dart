import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:stattrack/controller/activeplan_controller.dart';
import 'package:stattrack/model/ActivePlanModel.dart';
import 'package:stattrack/utils/LoadingWidget.dart';

import '../controller/expiredplan_controller.dart';
import '../utils/colors.dart';
import '../utils/commen.dart';
import '../utils/constant.dart';

class ExpiredPlanScreen extends StatelessWidget {
  const ExpiredPlanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<ExpiredPlanController>(
        init: ExpiredPlanController(),
        builder: (controller) {
          return Container(
            child: controller.isLoading.value
                ? LoadingWidget()
                : controller.subscriptionDataNew.isEmpty
                    ? Center(
                        child: Text(
                          "User subscribed plan not found",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      )
                    : ListView.builder(
                        itemCount: controller.subscriptionDataNew.length,
                        itemBuilder: (context, index) {
                          return Card(
                            margin: const EdgeInsets.only(
                                top: 10, left: 20, right: 20, bottom: 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
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
                                                fetchPlanName(
                                                    controller
                                                        .subscriptionDataNew,
                                                    index),
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
                                                fetchPlanDesc(
                                                    controller
                                                        .subscriptionDataNew,
                                                    index),
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
                        }),
          );
        });
  }

  String dateToStr(DateTime? dt) {
    final DateFormat formatter = DateFormat("EEE, MMMM, dd, yyyy");
    final String formatted = formatter.format(dt!);

    return formatted;
  }

  String fetchPlanDesc(
      RxList<SubscriptionPlans> subscriptionDataNewLcl, int indexPosList) {
    try {
      return subscriptionDataNewLcl.value[indexPosList].planDescription?[0] ??
          "";
    } catch (e) {
      return "N/A";
    }
  }

  String fetchPlanName(
      RxList<SubscriptionPlans> subscriptionDataNewLcl, int indexPosList) {
    try {
      return subscriptionDataNewLcl.value[indexPosList].planName?[0] ?? "";
    } catch (e) {
      return "N/A";
    }
  }
}
