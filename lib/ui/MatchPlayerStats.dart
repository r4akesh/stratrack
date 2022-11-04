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
                          child: appText(matchId[index].player?.name ?? "",
                              fontSize: 12),
                        )),
                    Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () async {
                            print("onTap call add");
                            //write
                            Players pp = matchId[index];
                            List listLcl = [];
                            //read
                            var result = MyApp.box.read(PLAYER_RECORD);
                            if (result != null) {
                              print("result>>${result.length}");
                              List jsonData = jsonDecode(result);
                              print("jsonData>>${jsonData}");
                              List<Players> mPlrList = jsonData
                                  .map((plr) => Players.fromJson(plr))
                                  .toList()
                                  .obs;
                              if (mPlrList != null) {
                                listLcl.addAll(mPlrList);
                              }
                              print("mPlrList>>${mPlrList.length}");
                            }

                            print("listLcl>>${listLcl.length}");
                            var plrsAsMap = pp.toJson();
                            listLcl.add(plrsAsMap);
                            String jsonString = jsonEncode(listLcl);
                            await MyApp.box.write(PLAYER_RECORD, jsonString);
                            toast("Player added sucessfully");

                            ///read
                            // var result2 = MyApp.box.read(PLAYER_RECORD);
                            // dynamic jsonData2 = jsonDecode(result2);
                            // List<Players> mPlr = jsonData2
                            //     .map((plr) => Players.fromJson(plr))
                            //     .toList()
                            //     .obs;
                            // print("on TAP>>${mPlr.length}");
                          },
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: Image.asset(
                              addIcon,
                              width: 30,
                              height: 30,
                            ),
                          ),
                        ))
                  ],
                ),
                SizedBox(
                  height: 7,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 2,
                        child: GestureDetector(
                          onTap: () {
                            var plrId = matchId[index].player?.id;
                            // print("plrID>>${plrId}");
                            Get.to(PlayerRecord(plrId!));
                          },
                          child: appText("Kick Returns Total",
                              fontSize: 12,
                              fontweight: FontWeight.w500,
                              textAlign: TextAlign.center),
                        )),
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                        flex: 2,
                        child: GestureDetector(
                          onTap: () {
                            var plrId = matchId[index].player?.id;
                            // print("plrID>>${plrId}");
                            Get.to(PlayerRecord(plrId!));
                          },
                          child: appText("Passing Yards",
                              fontSize: 12,
                              fontweight: FontWeight.w500,
                              textAlign: TextAlign.center),
                        )),
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                        flex: 2,
                        child: GestureDetector(
                          onTap: () {
                            var plrId = matchId[index].player?.id;
                            // print("plrID>>${plrId}");
                            Get.to(PlayerRecord(plrId!));
                          },
                          child: appText("Receiving Yards",
                              fontSize: 12,
                              fontweight: FontWeight.w500,
                              textAlign: TextAlign.center),
                        )),
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                        flex: 2,
                        child: GestureDetector(
                          onTap: () {
                            var plrId = matchId[index].player?.id;
                            //  print("plrID>>${plrId}");
                            Get.to(PlayerRecord(plrId!));
                          },
                          child: appText("Rushing Yards",
                              fontSize: 12,
                              fontweight: FontWeight.w500,
                              textAlign: TextAlign.center),
                        )),
                  ],
                ),
                SizedBox(
                  height: 3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                        flex: 2,
                        child: GestureDetector(
                          onTap: () {
                            var plrId = matchId[index].player?.id;
                            //  print("plrID>>${plrId}");
                            Get.to(PlayerRecord(plrId!));
                          },
                          child: appText(
                              matchId[index]
                                      .statistics
                                      ?.kickReturnsTotal
                                      .toString() ??
                                  "N/A",
                              fontSize: 12,
                              textAlign: TextAlign.center),
                        )),
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                        flex: 2,
                        child: GestureDetector(
                          onTap: () {
                            var plrId = matchId[index].player?.id;
                            //  print("plrID>>${plrId}");
                            Get.to(PlayerRecord(plrId!));
                          },
                          child: appText(
                              matchId[index]
                                      .statistics
                                      ?.passingYards
                                      .toString() ??
                                  "N/A",
                              fontSize: 12,
                              textAlign: TextAlign.center),
                        )),
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                        flex: 2,
                        child: GestureDetector(
                          onTap: () {
                            var plrId = matchId[index].player?.id;
                            //  print("plrID>>${plrId}");
                            Get.to(PlayerRecord(plrId!));
                          },
                          child: appText(
                              matchId[index]
                                      .statistics
                                      ?.receivingYards
                                      .toString() ??
                                  "N/A",
                              fontSize: 12,
                              textAlign: TextAlign.center),
                        )),
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                        flex: 2,
                        child: GestureDetector(
                          onTap: () {
                            var plrId = matchId[index].player?.id;
                            // print("plrID>>${plrId}");
                            Get.to(PlayerRecord(plrId!));
                          },
                          child: appText(
                              matchId[index]
                                      .statistics
                                      ?.rushingYards
                                      .toString() ??
                                  "N/A",
                              fontSize: 12,
                              textAlign: TextAlign.center),
                        )),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
