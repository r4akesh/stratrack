import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stattrack/controller/UpcomingMatchController.dart';
import 'package:stattrack/main.dart';
import 'package:stattrack/ui/MatchPlayerStats.dart';



import '../controller/MatchDetailController.dart';
import '../controller/OldMatchController.dart';
import '../utils/LoadingWidget.dart';
import '../utils/commen.dart';
import '../utils/constant.dart';

class MatchDetails extends StatelessWidget {
  var from = "";
  var oldMatchController = Get.put(OldMatchController());
  var upcomingMatchController = Get.put(UpcomingMatchController());
  MatchDetails({Key? key, required this.from}) : super(key: key);
  int? matchID;

    var matchDetailController = Get.put(MatchDetailController());
  var matchHighLightController = Get.put(MatchDetailController());
  String textMsg="";
  @override
  Widget build(BuildContext context) {
    if (from == "Upcoming") {
      matchDetailController.clearData();
      textMsg = "Match not started yet";
      matchID = upcomingMatchController.matchId;

    } else {

      textMsg = "No players found";
      matchID = oldMatchController.matchId;
      matchDetailController.getLineupsCall(matchID!);
    }
    matchHighLightController.matchHiglightCall(matchID!);
    return Scaffold(
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
                              backgroundColor: Colors.white,
                              radius: 40,
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
                            ):  SizedBox(
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 40,
                                child: ClipOval(
                                    child: Image.asset(appLogo)
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
                              return    controllerMatch
                                  .hightLightList.isNotEmpty?
                                CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 40,
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
                              ):  SizedBox(
                                child: CircleAvatar(
                                  radius: 40,
                                    backgroundColor: Colors.white,
                                  child: ClipOval(
                                      child: Image.asset(appLogo)
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
              height: 5,
            ),
            const Divider(
              thickness: 1,
            ),
            Expanded(
              child: GetBuilder<MatchDetailController>(
                builder: (controller) {
                  return controller.isLoading.value
                      ? LoadingWidget() : controller.homePlayerList.isEmpty
                          ?   Center(child: Text(textMsg, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),) : controller.isHome.value
                              ? MatchPlayerstats(controller.homePlayerList,controller.isHome) : MatchPlayerstats(controller.awayPlayerList,controller.isHome);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }



/*  Future<void> _launchUrl(String url) async {
    if (!await launch(
      url,
      forceSafariVC: true,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    )) {
      throw 'Could not launch $url';
    }
  }*/

  AppBar appBar() {
    return AppBar(
      toolbarHeight: 100,
      title: appText(
        from,
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
