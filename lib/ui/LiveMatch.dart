import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controller/LiveMatchController.dart';
import '../main.dart';
import '../utils/LoadingWidget.dart';
import '../utils/colors.dart';
import '../utils/commen.dart';
import '../utils/constant.dart';
import '../utils/progress_dialog.dart';
import 'match_details.dart';

class LiveMatch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<LiveMatchController>(
        init: LiveMatchController(),
        builder: (controller) {
          return Column(
            children: [
              Expanded(
                  child: controller.isLoading.value
                      ? LoadingWidget()
                      : controller.eventList.isEmpty
                          ? Center(
                              child: Text(
                                "No match found",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            )
                          : ListView.builder(
                              itemCount: controller.eventList.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    if (controller.eventList.length > 0) {
                                      controller.matchId =
                                          controller.eventList[index].id;
                                      MyApp.box.write(
                                          TeamHomeName,
                                          "" +
                                              controller.eventList.value[index]
                                                  .homeTeam!.name
                                                  .toString());
                                      MyApp.box.write(
                                          TeamAwayName,
                                          "" +
                                              controller.eventList.value[index]
                                                  .awayTeam!.name
                                                  .toString());
                                      MyApp.box.write(
                                          TeamHomeID,
                                          "" +
                                              controller.eventList.value[index]
                                                  .homeTeam!.id
                                                  .toString());
                                      MyApp.box.write(
                                          TeamAwayID,
                                          "" +
                                              controller.eventList.value[index]
                                                  .awayTeam!.id
                                                  .toString());
                                      print("Rakesh${controller.eventList.value[index].awayTeam!.name.toString()}");
                                      Get.to(MatchDetails(from: "Live"));
                                    } else {
                                      print("no data");
                                    }
                                  },
                                  child: Card(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 10),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 40,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          color: applightgrey,
                                          child: Row(
                                            children: [
                                              appText(
                                                  DateFormat(
                                                          "EEE, MMMM, dd, yyyy")
                                                      .format(DateTime
                                                          .fromMillisecondsSinceEpoch(
                                                              controller
                                                                      .eventList
                                                                      .value[
                                                                          index]
                                                                      .startTimestamp! *
                                                                  1000))
                                                      .toString(),
                                                  fontweight: FontWeight.w400,
                                                  txtColor: appBlack),
                                              Spacer(),
                                              appText(
                                                  DateFormat("hh:mm")
                                                      .format(DateTime
                                                          .fromMillisecondsSinceEpoch(
                                                              controller
                                                                      .eventList
                                                                      .value[
                                                                          index]
                                                                      .startTimestamp! *
                                                                  1000))
                                                      .toString(),
                                                  fontweight: FontWeight.w400,
                                                  txtColor: appBlack),
                                            ],
                                          ),
                                        ),
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                top: 15,
                                                bottom: 10,
                                                left: 10,
                                                right: 10),
                                            child: Row(
                                              children: [
                                                appText(
                                                    controller
                                                        .eventList
                                                        .value[index]
                                                        .homeTeam!
                                                        .name
                                                        .toString(),
                                                    fontweight: FontWeight.w400,
                                                    fontSize: 14),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                appText("VS",
                                                    fontweight: FontWeight.w600,
                                                    fontSize: 14),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                appText(
                                                    controller
                                                        .eventList
                                                        .value[index]
                                                        .awayTeam!
                                                        .name
                                                        .toString(),
                                                    fontweight: FontWeight.w400,
                                                    fontSize: 14),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                            alignment: Alignment.bottomRight,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 5),
                                            child: appText(
                                                controller.eventList
                                                    .value[index].status!.type!,
                                                fontweight: FontWeight.w400,
                                                fontSize: 14,
                                                txtColor: appLightBlue))
                                      ],
                                    ),
                                  ),
                                );
                              })),
            ],
          );
        });
  }
}
