

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stattrack/ui/player_record.dart';
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
    print("matchIdd>>${matchId}");
        return ListView.builder(
          itemCount: matchId.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.all(5),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 5, vertical: 10),

                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: GestureDetector(
                              onTap: (){
                                var plrId=matchId[index].player?.id;
                                print("plrID>>${plrId}");
                                Get.to(PlayerRecord(plrId!));
                              },
                              child: appText(matchId[index].player?.name ??"", fontSize: 12),
                            )),

                      ],
                    ),
                    SizedBox(height: 7,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                            child: GestureDetector(
                              onTap: (){
                                var plrId=matchId[index].player?.id;
                                print("plrID>>${plrId}");
                                Get.to(PlayerRecord(plrId!));
                              },
                              child: appText("Kick Returns Total", fontSize: 12,fontweight: FontWeight.w500, textAlign: TextAlign.center),
                            )),
                        SizedBox(width: 4,),
                        Expanded(
                            flex: 2,
                            child: GestureDetector(
                              onTap: (){
                                var plrId=matchId[index].player?.id;
                                print("plrID>>${plrId}");
                                Get.to(PlayerRecord(plrId!));
                              },
                              child: appText("Passing Yards", fontSize: 12,fontweight: FontWeight.w500,textAlign: TextAlign.center),
                            )),
                        SizedBox(width: 4,),
                        Expanded(
                            flex: 2,
                            child: GestureDetector(
                              onTap: (){
                                var plrId=matchId[index].player?.id;
                                print("plrID>>${plrId}");
                                Get.to(PlayerRecord(plrId!));
                              },
                              child: appText("Receiving Yards", fontSize: 12,fontweight: FontWeight.w500,textAlign: TextAlign.center),
                            )),
                        SizedBox(width: 4,),
                        Expanded(
                            flex: 2,
                            child: GestureDetector(
                              onTap: (){
                                var plrId=matchId[index].player?.id;
                                print("plrID>>${plrId}");
                                Get.to(PlayerRecord(plrId!));
                              },
                              child: appText("Rushing Yards", fontSize: 12 ,fontweight: FontWeight.w500,textAlign: TextAlign.center ),
                            )),

                      ],
                    ),
                    SizedBox(height: 3,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                            flex: 2,
                            child: GestureDetector(
                              onTap: (){
                                var plrId=matchId[index].player?.id;
                                print("plrID>>${plrId}");
                                Get.to(PlayerRecord(plrId!));
                              },
                              child: appText(matchId[index].statistics?.kickReturnsTotal.toString() ?? "N/A" , fontSize: 12, textAlign: TextAlign.center),
                            )),
                        SizedBox(width: 4,),
                        Expanded(
                            flex: 2,
                            child: GestureDetector(
                              onTap: (){
                                var plrId=matchId[index].player?.id;
                                print("plrID>>${plrId}");
                                Get.to(PlayerRecord(plrId!));
                              },
                              child: appText(matchId[index].statistics?.passingYards.toString() ?? "N/A", fontSize: 12,textAlign: TextAlign.center),
                            )),
                        SizedBox(width: 4,),
                        Expanded(
                            flex: 2,
                            child: GestureDetector(
                              onTap: (){
                                var plrId=matchId[index].player?.id;
                                print("plrID>>${plrId}");
                                Get.to(PlayerRecord(plrId!));
                              },
                              child: appText(matchId[index].statistics?.receivingYards.toString() ?? "N/A", fontSize: 12,textAlign: TextAlign.center),
                            )),
                        SizedBox(width: 4,),
                        Expanded(
                            flex: 2,
                            child: GestureDetector(
                              onTap: (){
                                var plrId=matchId[index].player?.id;
                                print("plrID>>${plrId}");
                                Get.to(PlayerRecord(plrId!));
                              },
                              child: appText(matchId[index].statistics?.rushingYards.toString() ?? "N/A", fontSize: 12,textAlign: TextAlign.center),
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
