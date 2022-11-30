import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:stattrack/main.dart';
import 'package:stattrack/ui/player_record.dart';
import 'package:stattrack/utils/constant.dart';
import '../controller/MatchPlayerStatsController.dart';
import '../model/matchdetail_model.dart';
import '../utils/LoadingWidget.dart';
import '../utils/colors.dart';
import '../utils/commen.dart';

class MatchPlayerstats extends StatelessWidget {
  RxList<Players> matchId;
  RxBool isHome;
  MatchPlayerstats(this.matchId, this.isHome, {Key? key}) : super(key: key);
  // var matchPlayerStatsController = Get.put(MatchPlayerStatsController());
  @override
  Widget build(BuildContext context) {
    // print("matchIdd>>${matchId}");
    return ListView.builder(
      itemCount: matchId.length,
      itemBuilder: (context, index) {
        return Card(
          color: applightgrey,
          margin: EdgeInsets.all(5),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: GestureDetector(
                          onTap: () {
                            var plrId = matchId[index].player?.id;
                            //  print("plrID>>${plrId}");
                            Get.to(PlayerRecord(plrId!));
                          },
                          child: Expanded(
                            child: appText(matchId[index].player?.name ?? "",
                                fontSize: 12),
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: Container(
                            alignment: Alignment.centerRight,
                            child: appText(matchId[index].position ?? "",
                                fontSize: 12,
                                fontweight: FontWeight.w700,
                                textAlign: TextAlign.end)))
                  ],
                ),
                SizedBox(
                  height: 7,
                ),
                Container(child: Builder(
                  builder: (context) {
                    switch (matchId[index].position) {
                      case "QB":
                        {
                          return qbView(index);
                        }
                      case "TE":
                        {
                          return teView(index);
                        }
                      case "RB":
                        {
                          return rbView(index);
                        }
                      case "WR":
                        {
                          return wrView(index);
                        }
                      default:
                        {
                          return Text("N/AAAA");
                        }
                    }
                  },
                )),

                SizedBox(
                  height: 3,
                ),
                //   Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //     children: [
                //       Expanded(
                //           flex: 2,
                //           child: GestureDetector(
                //             onTap: () {
                //               var plrId = matchId[index].player?.id;
                //               //  print("plrID>>${plrId}");
                //               Get.to(PlayerRecord(plrId!));
                //             },
                //             child: appText(
                //                 matchId[index]
                //                         .statistics
                //                         ?.kickReturnsTotal
                //                         .toString() ??
                //                     "N/A",
                //                 fontSize: 12,
                //                 textAlign: TextAlign.center),
                //           )),
                //       SizedBox(
                //         width: 4,
                //       ),
                //       Expanded(
                //           flex: 2,
                //           child: GestureDetector(
                //             onTap: () {
                //               var plrId = matchId[index].player?.id;
                //               //  print("plrID>>${plrId}");
                //               Get.to(PlayerRecord(plrId!));
                //             },
                //             child: appText(
                //                 matchId[index]
                //                         .statistics
                //                         ?.passingYards
                //                         .toString() ??
                //                     "N/A",
                //                 fontSize: 12,
                //                 textAlign: TextAlign.center),
                //           )),
                //       SizedBox(
                //         width: 4,
                //       ),
                //       Expanded(
                //           flex: 2,
                //           child: GestureDetector(
                //             onTap: () {
                //               var plrId = matchId[index].player?.id;
                //               //  print("plrID>>${plrId}");
                //               Get.to(PlayerRecord(plrId!));
                //             },
                //             child: appText(
                //                 matchId[index]
                //                         .statistics
                //                         ?.receivingYards
                //                         .toString() ??
                //                     "N/A",
                //                 fontSize: 12,
                //                 textAlign: TextAlign.center),
                //           )),
                //       SizedBox(
                //         width: 4,
                //       ),
                //       Expanded(
                //           flex: 2,
                //           child: GestureDetector(
                //             onTap: () {
                //               var plrId = matchId[index].player?.id;
                //               // print("plrID>>${plrId}");
                //               Get.to(PlayerRecord(plrId!));
                //             },
                //             child: appText(
                //                 matchId[index]
                //                         .statistics
                //                         ?.rushingYards
                //                         .toString() ??
                //                     "N/A",
                //                 fontSize: 12,
                //                 textAlign: TextAlign.center),
                //           )),
                //     ],
                //   )
                //
              ],
            ),
          ),
        );
      },
    );
  }

  Widget qbView(int indexPos) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 2,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        appText("Passing Attempts",
                            fontSize: 11,
                            fontweight: FontWeight.w500,
                            textAlign: TextAlign.start),
                        appText(
                            matchId[indexPos]
                                    .statistics
                                    ?.passingAttempts
                                    .toString() ??
                                "N/A",
                            fontSize: 12,
                            fontweight: FontWeight.w600,
                            textAlign: TextAlign.end),
                      ],
                    ),
                  ),
                )),
            Expanded(
                flex: 2,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        appText("Passing Completions",
                            fontSize: 11,
                            fontweight: FontWeight.w500,
                            textAlign: TextAlign.start),
                        appText(
                            matchId[indexPos]
                                    .statistics
                                    ?.passingCompletions
                                    .toString() ??
                                "N/A",
                            fontSize: 12,
                            fontweight: FontWeight.w600,
                            textAlign: TextAlign.end),
                      ],
                    ),
                  ),
                )),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 2,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        appText("Passing Interceptions",
                            fontSize: 11,
                            fontweight: FontWeight.w500,
                            textAlign: TextAlign.start),
                        appText(
                            matchId[indexPos]
                                    .statistics
                                    ?.passingInterceptions
                                    .toString() ??
                                "N/A",
                            fontSize: 12,
                            fontweight: FontWeight.w600,
                            textAlign: TextAlign.end),
                      ],
                    ),
                  ),
                )),
            Expanded(
                flex: 2,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        appText("Passing Longest",
                            fontSize: 11,
                            fontweight: FontWeight.w500,
                            textAlign: TextAlign.start),
                        appText(
                            matchId[indexPos]
                                    .statistics
                                    ?.passingLongest
                                    .toString() ??
                                "N/A",
                            fontSize: 12,
                            fontweight: FontWeight.w600,
                            textAlign: TextAlign.end),
                      ],
                    ),
                  ),
                )),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 2,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        appText("Passing Net Yards",
                            fontSize: 11,
                            fontweight: FontWeight.w500,
                            textAlign: TextAlign.start),
                        appText(
                            matchId[indexPos]
                                    .statistics
                                    ?.passingNetYards
                                    .toString() ??
                                "N/A",
                            fontSize: 12,
                            fontweight: FontWeight.w600,
                            textAlign: TextAlign.end),
                      ],
                    ),
                  ),
                )),
            Expanded(
                flex: 2,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        appText("Passing Sacked",
                            fontSize: 11,
                            fontweight: FontWeight.w500,
                            textAlign: TextAlign.start),
                        appText(
                            matchId[indexPos]
                                    .statistics
                                    ?.passingSacked
                                    .toString() ??
                                "N/A",
                            fontSize: 12,
                            fontweight: FontWeight.w600,
                            textAlign: TextAlign.end),
                      ],
                    ),
                  ),
                )),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 2,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        appText("Passing Touchdowns",
                            fontSize: 11,
                            fontweight: FontWeight.w500,
                            textAlign: TextAlign.start),
                        appText(
                            matchId[indexPos]
                                    .statistics
                                    ?.passingTouchdowns
                                    .toString() ??
                                "N/A",
                            fontSize: 12,
                            fontweight: FontWeight.w600,
                            textAlign: TextAlign.end),
                      ],
                    ),
                  ),
                )),
            Expanded(
                flex: 2,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        appText("Passing Yards",
                            fontSize: 11,
                            fontweight: FontWeight.w500,
                            textAlign: TextAlign.start),
                        appText(
                            matchId[indexPos]
                                    .statistics
                                    ?.passingYards
                                    .toString() ??
                                "N/A",
                            fontSize: 12,
                            fontweight: FontWeight.w600,
                            textAlign: TextAlign.end),
                      ],
                    ),
                  ),
                )),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 2,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        appText("Passing Yards Per Attempt",
                            fontSize: 11,
                            fontweight: FontWeight.w500,
                            textAlign: TextAlign.start),
                        appText(
                            matchId[indexPos]
                                    .statistics
                                    ?.passingYardsPerAttempt
                                    .toString() ??
                                "N/A",
                            fontSize: 12,
                            fontweight: FontWeight.w600,
                            textAlign: TextAlign.end),
                      ],
                    ),
                  ),
                )),
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [],
                  ),
                )),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 2,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        appText("Rushing Attempts",
                            fontSize: 11,
                            fontweight: FontWeight.w500,
                            textAlign: TextAlign.start),
                        appText(
                            matchId[indexPos]
                                    .statistics
                                    ?.rushingAttempts
                                    .toString() ??
                                "N/A",
                            fontSize: 12,
                            fontweight: FontWeight.w600,
                            textAlign: TextAlign.end),
                      ],
                    ),
                  ),
                )),
            Expanded(
                flex: 2,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        appText("Rushing Longest",
                            fontSize: 11,
                            fontweight: FontWeight.w500,
                            textAlign: TextAlign.start),
                        appText(
                            matchId[indexPos]
                                    .statistics
                                    ?.rushingLongest
                                    .toString() ??
                                "N/A",
                            fontSize: 12,
                            fontweight: FontWeight.w600,
                            textAlign: TextAlign.end),
                      ],
                    ),
                  ),
                )),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 2,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        appText("Rushing Touchdowns",
                            fontSize: 11,
                            fontweight: FontWeight.w500,
                            textAlign: TextAlign.start),
                        appText(
                            matchId[indexPos]
                                    .statistics
                                    ?.rushingTouchdowns
                                    .toString() ??
                                "N/A",
                            fontSize: 12,
                            fontweight: FontWeight.w600,
                            textAlign: TextAlign.end),
                      ],
                    ),
                  ),
                )),
            Expanded(
                flex: 2,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        appText("Rushing Yards",
                            fontSize: 11,
                            fontweight: FontWeight.w500,
                            textAlign: TextAlign.start),
                        appText(
                            matchId[indexPos]
                                    .statistics
                                    ?.rushingYards
                                    .toString() ??
                                "N/A",
                            fontSize: 12,
                            fontweight: FontWeight.w600,
                            textAlign: TextAlign.end),
                      ],
                    ),
                  ),
                )),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 2,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        appText("Rushing Yards Per Attempt",
                            fontSize: 11,
                            fontweight: FontWeight.w500,
                            textAlign: TextAlign.start),
                        appText(
                            matchId[indexPos]
                                    .statistics
                                    ?.rushingYardsPerAttempt
                                    .toString() ??
                                "N/A",
                            fontSize: 12,
                            fontweight: FontWeight.w600,
                            textAlign: TextAlign.end),
                      ],
                    ),
                  ),
                )),
            Expanded(flex: 1, child: Container()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 2,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        appText("Fumble Fumbles",
                            fontSize: 11,
                            fontweight: FontWeight.w500,
                            textAlign: TextAlign.start),
                        appText(
                            matchId[indexPos]
                                    .statistics
                                    ?.fumbleFumbles
                                    .toString() ??
                                "N/A",
                            fontSize: 12,
                            fontweight: FontWeight.w600,
                            textAlign: TextAlign.end),
                      ],
                    ),
                  ),
                )),
            Expanded(
                flex: 2,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        appText("Fumble Lost",
                            fontSize: 11,
                            fontweight: FontWeight.w500,
                            textAlign: TextAlign.start),
                        appText(
                            matchId[indexPos]
                                    .statistics
                                    ?.fumbleLost
                                    .toString() ??
                                "N/A",
                            fontSize: 12,
                            fontweight: FontWeight.w600,
                            textAlign: TextAlign.end),
                      ],
                    ),
                  ),
                )),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 2,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        appText("Fumble Recovery",
                            fontSize: 11,
                            fontweight: FontWeight.w500,
                            textAlign: TextAlign.start),
                        appText(
                            matchId[indexPos]
                                    .statistics
                                    ?.fumbleRecovery
                                    .toString() ??
                                "N/A",
                            fontSize: 12,
                            fontweight: FontWeight.w600,
                            textAlign: TextAlign.end),
                      ],
                    ),
                  ),
                )),
            Expanded(flex: 1, child: Container()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 2,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        appText("Fumble Touchdown Returns",
                            fontSize: 11,
                            fontweight: FontWeight.w500,
                            textAlign: TextAlign.start),
                        appText(
                            matchId[indexPos]
                                    .statistics
                                    ?.fumbleTouchdownReturns
                                    .toString() ??
                                "N/A",
                            fontSize: 12,
                            fontweight: FontWeight.w600,
                            textAlign: TextAlign.end),
                      ],
                    ),
                  ),
                )),
            Expanded(flex: 1, child: Container()),
          ],
        ),
      ],
    );
  }

  Widget teView(int indexTe) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 2,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        appText("Receiving Longest",
                            fontSize: 11,
                            fontweight: FontWeight.w500,
                            textAlign: TextAlign.start),
                        appText(
                            matchId[indexTe]
                                    .statistics
                                    ?.receivingLongest
                                    .toString() ??
                                "N/A",
                            fontSize: 12,
                            fontweight: FontWeight.w600,
                            textAlign: TextAlign.end),
                      ],
                    ),
                  ),
                )),
            Expanded(
                flex: 2,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        appText("Receiving Receptions",
                            fontSize: 11,
                            fontweight: FontWeight.w500,
                            textAlign: TextAlign.start),
                        appText(
                            matchId[indexTe]
                                    .statistics
                                    ?.receivingReceptions
                                    .toString() ??
                                "N/A",
                            fontSize: 12,
                            fontweight: FontWeight.w600,
                            textAlign: TextAlign.end),
                      ],
                    ),
                  ),
                )),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 2,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        appText("Receiving Touchdowns",
                            fontSize: 11,
                            fontweight: FontWeight.w500,
                            textAlign: TextAlign.start),
                        appText(
                            matchId[indexTe]
                                    .statistics
                                    ?.receivingTouchdowns
                                    .toString() ??
                                "N/A",
                            fontSize: 12,
                            fontweight: FontWeight.w600,
                            textAlign: TextAlign.end),
                      ],
                    ),
                  ),
                )),
            Expanded(
                flex: 2,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        appText("Receiving Yards",
                            fontSize: 11,
                            fontweight: FontWeight.w500,
                            textAlign: TextAlign.start),
                        appText(
                            matchId[indexTe]
                                    .statistics
                                    ?.receivingYards
                                    .toString() ??
                                "N/A",
                            fontSize: 12,
                            fontweight: FontWeight.w600,
                            textAlign: TextAlign.end),
                      ],
                    ),
                  ),
                )),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 2,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        appText("Receiving Yards Per Reception",
                            fontSize: 11,
                            fontweight: FontWeight.w500,
                            textAlign: TextAlign.start),
                        appText(
                            matchId[indexTe]
                                    .statistics
                                    ?.receivingYardsPerReception
                                    .toString() ??
                                "N/A",
                            fontSize: 12,
                            fontweight: FontWeight.w600,
                            textAlign: TextAlign.end),
                      ],
                    ),
                  ),
                )),
            Expanded(flex: 1, child: Container()),
          ],
        ),
      ],
    );
  }

  Widget rbView(int indexRb) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 2,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        appText("Rushing Attempts",
                            fontSize: 11,
                            fontweight: FontWeight.w500,
                            textAlign: TextAlign.start),
                        appText(
                            matchId[indexRb]
                                    .statistics
                                    ?.rushingAttempts
                                    .toString() ??
                                "N/A",
                            fontSize: 12,
                            fontweight: FontWeight.w600,
                            textAlign: TextAlign.end),
                      ],
                    ),
                  ),
                )),
            Expanded(
                flex: 2,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        appText("Rushing Longest",
                            fontSize: 11,
                            fontweight: FontWeight.w500,
                            textAlign: TextAlign.start),
                        appText(
                            matchId[indexRb]
                                    .statistics
                                    ?.rushingLongest
                                    .toString() ??
                                "N/A",
                            fontSize: 12,
                            fontweight: FontWeight.w600,
                            textAlign: TextAlign.end),
                      ],
                    ),
                  ),
                )),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 2,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        appText("Rushing Touchdowns",
                            fontSize: 11,
                            fontweight: FontWeight.w500,
                            textAlign: TextAlign.start),
                        appText(
                            matchId[indexRb]
                                    .statistics
                                    ?.rushingTouchdowns
                                    .toString() ??
                                "N/A",
                            fontSize: 12,
                            fontweight: FontWeight.w600,
                            textAlign: TextAlign.end),
                      ],
                    ),
                  ),
                )),
            Expanded(
                flex: 2,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        appText("Rushing Yards",
                            fontSize: 11,
                            fontweight: FontWeight.w500,
                            textAlign: TextAlign.start),
                        appText(
                            matchId[indexRb]
                                    .statistics
                                    ?.rushingYards
                                    .toString() ??
                                "N/A",
                            fontSize: 12,
                            fontweight: FontWeight.w600,
                            textAlign: TextAlign.end),
                      ],
                    ),
                  ),
                )),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 2,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        appText("Rushing Yards Per Attempt",
                            fontSize: 11,
                            fontweight: FontWeight.w500,
                            textAlign: TextAlign.start),
                        appText(
                            matchId[indexRb]
                                    .statistics
                                    ?.rushingYardsPerAttempt
                                    .toString() ??
                                "N/A",
                            fontSize: 12,
                            fontweight: FontWeight.w600,
                            textAlign: TextAlign.end),
                      ],
                    ),
                  ),
                )),
            Expanded(flex: 1, child: Container()),
          ],
        ),
      ],
    );
  }

  Widget wrView(int indexWr) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 2,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        appText("Defensive Assist Tackles",
                            fontSize: 11,
                            fontweight: FontWeight.w500,
                            textAlign: TextAlign.start),
                        appText(
                            matchId[indexWr]
                                    .statistics
                                    ?.rushingAttempts
                                    .toString() ??
                                "N/A",
                            fontSize: 12,
                            fontweight: FontWeight.w600,
                            textAlign: TextAlign.end),
                      ],
                    ),
                  ),
                )),
            Expanded(flex: 1, child: Container()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 2,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        appText("Defensive Forced Fumbles",
                            fontSize: 11,
                            fontweight: FontWeight.w500,
                            textAlign: TextAlign.start),
                        appText(
                            matchId[indexWr]
                                    .statistics
                                    ?.rushingTouchdowns
                                    .toString() ??
                                "N/A",
                            fontSize: 12,
                            fontweight: FontWeight.w600,
                            textAlign: TextAlign.end),
                      ],
                    ),
                  ),
                )),
            Expanded(flex: 1, child: Container()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 2,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        appText("Defensive Passes Defensed",
                            fontSize: 11,
                            fontweight: FontWeight.w500,
                            textAlign: TextAlign.start),
                        appText(
                            matchId[indexWr]
                                    .statistics
                                    ?.rushingYardsPerAttempt
                                    .toString() ??
                                "N/A",
                            fontSize: 12,
                            fontweight: FontWeight.w600,
                            textAlign: TextAlign.end),
                      ],
                    ),
                  ),
                )),
            Expanded(flex: 1, child: Container()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 2,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        appText("Defensive Combine Tackles",
                            fontSize: 11,
                            fontweight: FontWeight.w500,
                            textAlign: TextAlign.start),
                        appText(
                            matchId[indexWr]
                                    .statistics
                                    ?.rushingYardsPerAttempt
                                    .toString() ??
                                "N/A",
                            fontSize: 12,
                            fontweight: FontWeight.w600,
                            textAlign: TextAlign.end),
                      ],
                    ),
                  ),
                )),
            Expanded(flex: 1, child: Container()),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 2,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        appText("Defensive Sacks",
                            fontSize: 11,
                            fontweight: FontWeight.w500,
                            textAlign: TextAlign.start),
                        appText(
                            matchId[indexWr]
                                    .statistics
                                    ?.rushingYardsPerAttempt
                                    .toString() ??
                                "N/A",
                            fontSize: 12,
                            fontweight: FontWeight.w600,
                            textAlign: TextAlign.end),
                      ],
                    ),
                  ),
                )),
            Expanded(flex: 1, child: Container()),
          ],
        ),
      ],
    );
  }
}
