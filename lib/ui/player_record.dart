import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:stattrack/controller/playerDetailController.dart';
import 'package:stattrack/main.dart';
import 'package:stattrack/utils/LoadingWidget.dart';

import '../model/myDashboard.dart';
import '../utils/colors.dart';
import '../utils/commen.dart';
import '../utils/constant.dart';

class PlayerRecord extends StatelessWidget {
  int plrId;
  PlayerRecord(this.plrId, {Key? key}) : super(key: key);
  // final box = Hive.box('boxName');
  var plrDetailController = Get.put(PlayerDetailController());
  @override
  Widget build(BuildContext context) {
    plrDetailController.plrDetailAPICall(plrId);
    List<UserData> listUd = <UserData>[];
    return GetBuilder<PlayerDetailController>(
      init: PlayerDetailController(),
      builder: (value) => Scaffold(
        body: Stack(
          children: [
            Container(
              height: 300,
              child: Image.asset(
                topHeaderImg2,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
                left: 15,
                top: 50,
                child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Image.asset(
                      backIcon,
                      scale: 3,
                      color: Colors.white,
                      width: 20,
                      height: 20,
                    ))),
            Padding(
              padding: EdgeInsets.only(top: 60),
              child: value.isLoading.value
                  ? LoadingWidget()
                  : Column(
                      children: [
                        // appText("Action",txtColor: Colors.white),
                        const SizedBox(
                          height: 25,
                        ),
                        Container(
                          height: 100,
                          width: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Container(
                              height: 100,
                              child: FadeInImage(
                                  image: NetworkImage(
                                      "https://allsportsapi2.p.rapidapi.com/api/american-football/player/$plrId/image",
                                      headers: const {
                                        "X-RapidAPI-Key": RAPID_API_KEY,
                                        "X-RapidAPI-Host":
                                            "allsportsapi2.p.rapidapi.com"
                                      }),
                                  placeholder: AssetImage(appLogo)),
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 10,
                        ),
                        appText(
                            plrDetailController.playerDetail.value.name ??
                                "N/A",
                            txtColor: Colors.white),
                        appText(
                            plrDetailController
                                    .playerDetail.value.team?.country?.name ??
                                "N/A",
                            txtColor: Colors.white,
                            fontSize: 14),
                        const SizedBox(
                          height: 60,
                        ),

                        Padding(
                          padding:
                              EdgeInsets.only(top: 30, left: 10, bottom: 10),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: appText("Personal Information",
                                  txtColor: Colors.black,
                                  textAlign: TextAlign.start,
                                  fontweight: FontWeight.normal)),
                        ),
                        Column(
                          children: [
                            rowPersonal(
                                "DOB",
                                DateFormat('dd MMM, yyyy').format(
                                    DateTime.fromMillisecondsSinceEpoch(
                                        plrDetailController.playerDetail.value
                                            .dateOfBirthTimestamp!))),
                            rowPersonal(
                                "Height",
                                plrDetailController.playerDetail.value.height
                                    .toString()),
                            rowPersonal(
                                "Position",
                                plrDetailController.playerDetail.value.position
                                    .toString()),
                            rowPersonal(
                                "Team Name",
                                plrDetailController
                                        .playerDetail.value.team?.name ??
                                    "".toString()),
                          ],
                        )
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget rowPersonal(String s1, String s2) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Container(
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: appText(s1,
                      txtColor: Colors.black,
                      textAlign: TextAlign.start,
                      fontweight: FontWeight.normal,
                      fontSize: 12),
                )),
            Expanded(
                flex: 2,
                child: appText(s2,
                    txtColor: Colors.black,
                    textAlign: TextAlign.start,
                    fontweight: FontWeight.normal,
                    fontSize: 12))
          ],
        ),
      ),
    );
  }
}
