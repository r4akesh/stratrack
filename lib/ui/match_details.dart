import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stattrack/main.dart';
import 'package:stattrack/ui/MatchPlayerStats.dart';
import 'package:stattrack/ui/player_record.dart';
import 'package:stattrack/ui/team_details.dart';
import 'package:stattrack/utils/colors.dart';

import '../controller/MatchDetailController.dart';
import '../controller/OldMatchController.dart';
import '../utils/LoadingWidget.dart';
import '../utils/commen.dart';
import '../utils/constant.dart';

class MatchDetails extends StatelessWidget {
  var from = "";
  var oldMatchController = Get.put(OldMatchController());
  MatchDetails({Key? key, required this.from}) : super(key: key);
  int? matchID;

  var matchDetailController = Get.put(MatchDetailController());
  @override
  Widget build(BuildContext context) {
    matchID =oldMatchController.matchId;
    matchDetailController.getLineupsCall(matchID!);
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
                    onTap: (){
                      print("object");
                      matchDetailController.updateView(true);
                    },
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 40,
                          child: ClipOval(
                            child: Image.asset(demoImage),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        appText(MyApp.box.read(TeamHomeName),textAlign: TextAlign.center)
                      ],
                    ),
                  ),
                ),
                appText("VS"),
                
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      matchDetailController.updateView(false);
                    },
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 40,
                          child: ClipOval(
                            child: Image.asset(demoImage),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        appText(MyApp.box.read(TeamAwayName), textAlign: TextAlign.center)
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            appText("Saturday, August 13,2022",
                txtColor: appTextGrey,
                fontweight: FontWeight.w400,
                fontSize: 14),
            appText("Live From Hard Rock Stadium United States",
                txtColor: appTextGrey,
                fontweight: FontWeight.w400,
                fontSize: 14),
            const SizedBox(
              height: 15,
            ),
            const Divider(
              thickness: 1,
            ),
            Expanded(
              child: GetBuilder<MatchDetailController>(builder: ( controller) {
                return controller.isLoading.value? LoadingWidget():controller.homePlayerList.isEmpty?Center(child: Text("No match found",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),) : controller.isHome.value ?  MatchPlayerstats(controller.homePlayerList) : MatchPlayerstats(controller.awayPlayerList)  ;
              }, ),
            ),
          ],
        ),
      ),
    );
  }

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
