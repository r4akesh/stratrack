

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stattrack/ui/player_record.dart';
import '../controller/MatchPlayerStatsController.dart';
import '../utils/LoadingWidget.dart';
import '../utils/commen.dart';

class MatchPlayerstats extends StatelessWidget {
  var matchId;
   MatchPlayerstats(this.matchId, {Key? key}) : super(key: key);
  var matchPlayerStatsController = Get.put(MatchPlayerStatsController());
  @override
  Widget build(BuildContext context) {
    matchPlayerStatsController.matchIdd = matchId;
    print("matchIdd>>${matchPlayerStatsController.matchIdd}");
    return
      GetX<MatchPlayerStatsController>(
      init: MatchPlayerStatsController() ,
      builder: (controller){
        return Expanded(
          child: controller.isLoading.value? LoadingWidget():controller.homePlayers.isEmpty?Center(child: Text("No match found",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),):

          ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.all(5),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 5, vertical: 20),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: GestureDetector(
                            onTap: (){
                              Get.to(PlayerRecord());
                            },
                            child: appText("Evan McPherson",
                                fontSize: 12),
                          )),
                      for (var i = 0; i < 6; i++) ...[
                        Expanded(
                          child: Container(
                              width: 40,
                              alignment: Alignment.center,
                              child: appText("2",
                                  fontweight: FontWeight.w400,
                                  fontSize: 12)),
                        )
                      ]
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );

  }
}
