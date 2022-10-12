import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stattrack/controller/UpcomingMatchController.dart';
import 'package:stattrack/main.dart';
import 'package:stattrack/ui/MatchPlayerStats.dart';



import '../controller/MatchDetailController.dart';
import '../controller/OldMatchController.dart';
import '../utils/LoadingWidget.dart';
import '../utils/commen.dart';
import '../utils/constant.dart';
import 'MatchStats.dart';

class MatchDetails extends StatefulWidget {
  var from = "";

  MatchDetails({Key? key, required this.from}) : super(key: key);

  @override
  State<MatchDetails> createState() => _MatchDetailsState();
}


class _MatchDetailsState extends State<MatchDetails> {
  var oldMatchController = Get.put(OldMatchController());
  var upcomingMatchController = Get.put(UpcomingMatchController());
  int? matchID;
  var matchDetailController = Get.put(MatchDetailController());
  var matchHighLightController = Get.put(MatchDetailController());
  String textMsg="";
@override
  void initState() {
  matchDetailController.isStats.value=true;
  matchDetailController.isHome.value=true;
  matchDetailController.hightLightList.value.clear();
  matchDetailController.homePlayerList.value.clear();
  matchDetailController.awayPlayerList.value.clear();
  matchDetailController.staticList.value.clear();
  print("init value ${ matchDetailController.isHome.value}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.from == "Upcoming") {
      matchDetailController.clearData();
      textMsg = "Match not started yet";
      matchID = upcomingMatchController.matchId;

    } else {
      textMsg = "No players found";
      matchID = oldMatchController.matchId;
     // matchDetailController.getLineupsCall(matchID!);
      matchDetailController.getStatisticsCall(matchID!);
    }
    matchHighLightController.matchHiglightCall(matchID!);
    return GetBuilder<MatchDetailController>(init: MatchDetailController() ,builder: (valueController)=>
      Scaffold(
      appBar: appBar(),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 30,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      print("object");
                       matchDetailController.updateView(true);
                    },
                    child:  Column(
                      children: [
                        GetX<MatchDetailController>(
                          init: MatchDetailController(),
                          builder: (controllerMatch) {
                            return controllerMatch.hightLightList.isNotEmpty?
                              CircleAvatar(
                                radius: 40,
                                backgroundColor:  matchDetailController.isHome.value? Colors.blue : Colors.white,
                                child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 38,
                                child: ClipOval(
                                  child: controllerMatch.isLoadingTwo.value
                                      ? Image.asset(appLogo)
                                      : Image.network(
                                          controllerMatch
                                              .hightLightList[0].thumbnailUrl!,
                                          fit: BoxFit.fill,
                                          width: 100,
                                          height: 100,
                                        ),
                                ),
                            ),
                              ):  SizedBox(
                              child: CircleAvatar(
                                radius: 40,
                                backgroundColor: matchDetailController.isHome.value? Colors.blue : Colors.white,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 38,
                                  child: ClipOval(
                                      child: Image.asset(appLogo)
                                  ),
                                ),
                              ),
                            ) ;
                          },
                        ) ,
                        const SizedBox(
                          height: 10,
                        ),
                        Container(

                          height: 40,
                          child: appText(MyApp.box.read(TeamHomeName),
                              textAlign: TextAlign.center),
                        )
                      ],
                    ),
                  ),
                ),
                appText("VS", ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                        matchDetailController.updateView(false);
                    },
                    child: Column(
                      children: [
                        GetX<MatchDetailController>(
                            init: MatchDetailController(),
                            builder: (controllerMatch) {
                              return controllerMatch.hightLightList.isNotEmpty?
                                CircleAvatar(
                                  backgroundColor: matchDetailController.isHome.value? Colors.white : Colors.blue,
                                  radius: 40,
                                  child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 38,
                                  child: ClipOval(
                                      child: controllerMatch
                                              .isLoadingTwo.value
                                          ? Image.asset(appLogo)
                                          : controllerMatch
                                                      .hightLightList.length >
                                                  1
                                              ? Image.network(
                                        controllerMatch
                                                      .hightLightList[1]
                                                      .thumbnailUrl!,
                                                  fit: BoxFit.fill,
                                                  width: 100,
                                                  height: 100,
                                                )
                                              : Image.asset(appLogo)),
                              ),
                                ):  SizedBox(
                                child: CircleAvatar(
                                  radius: 40,
                                  backgroundColor: matchDetailController.isHome.value? Colors.white : Colors.blue,
                                  child: CircleAvatar(
                                    radius: 38,
                                      backgroundColor: Colors.white,
                                    child: ClipOval(
                                        child: Image.asset(appLogo)
                                    ),
                                  ),
                                ),
                              ) ;
                            }),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 40,

                          child: appText(MyApp.box.read(TeamAwayName),
                              textAlign: TextAlign.center),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),


            const SizedBox(
              height: 1,
            ),
            const Divider(
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                onTap: (){
                 valueController.updateViewStatsOrPlayer(true);
                },
                child:  Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text( "Stats",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700,color: valueController.isStats.value ? Colors.blue : Colors.black)),
                ),
              ),
              Container(
                color: Colors.black12,
                height: 15,
                width: 2,

              ),
              InkWell(
                onTap: (){
                  print("onTap");
                  print(valueController.homePlayerList.length);
                  if(valueController.homePlayerList.isEmpty ) {

                    matchDetailController.getLineupsCall(matchID!);

                  }
                    valueController.updateViewStatsOrPlayer(false);


                },
                child:  Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text("Player",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700,color: valueController.isStats.value ? Colors.black : Colors.blue ),),
                ),
              ),

            ],),
            const SizedBox(
              height: 1,
            ),
            Expanded(
              child: valueController.isStats.value ?
              GetBuilder<MatchDetailController>(
                builder: (controller) {
                  return controller.isLoading.value
                      ? LoadingWidget() : controller.staticList.isEmpty
                      ?   Center(child: Text(textMsg, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),) : MatchStats(controller.staticList,controller.isHome)  ;
                },
              )
                  :
              GetBuilder<MatchDetailController>(
                builder: (controller) {
                  return controller.isLoading.value
                      ? LoadingWidget() : controller.homePlayerList.isEmpty
                      ?   Center(child: Text(textMsg, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),) : controller.isHome.value
                      ? MatchPlayerstats(controller.homePlayerList,controller.isHome) : MatchPlayerstats(controller.awayPlayerList,controller.isHome);
                },
              )

              ,
            ),
          ],
        ),
      ),
    )
    );
  }

  AppBar appBar() {
    return AppBar(
      toolbarHeight: 100,
      title: appText(
        widget.from,
        txtColor: Colors.white,
      ),
      centerTitle: true,
      elevation: 0,
      flexibleSpace: Image.asset(
        topHeaderImg,
        fit: BoxFit.fill,
      ),
    );
  }
}
