import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../controller/player_allteam_controller.dart';
import '../utils/LoadingWidget.dart';
import '../utils/commen.dart';
import '../utils/constant.dart';

class ForeginPlayerScreen extends StatelessWidget {
  String teamID;
  int posTab;
  ForeginPlayerScreen(this.teamID, this.posTab);
  bool isListEmpty = false;
  @override
  Widget build(BuildContext context) {
    return GetX<PlayerAllTeamController>(
        init: PlayerAllTeamController(teamID),
        builder: (contrloerTemPlr) {
          return Column(
            children: [
              Expanded(
                  child: contrloerTemPlr.isLoading.value
                      ? LoadingWidget()
                      : isMyListEmty(
                              contrloerTemPlr) // contrloerTemPlr.forieginPlayerList.isEmpty
                          ? Center(
                              child: Text(
                                "No Player found",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            )
                          : ListView.builder(
                              itemCount: myListLenght(
                                  contrloerTemPlr), //contrloerTemPlr.forieginPlayerList.length,
                              itemBuilder: (context, index) {
                                return Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    color: Colors.white,
                                    margin: const EdgeInsets.only(
                                        top: 5, left: 10, right: 10),
                                    child: SizedBox(
                                      height: 80,
                                      child: Row(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(55),
                                                    bottomLeft: Radius.circular(
                                                        55)), // Image border
                                            child: Image.asset(
                                              demoImage4,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          appText(
                                              playerName(
                                                  contrloerTemPlr, index),
                                              fontweight: FontWeight.w400),
                                        ],
                                      ),
                                    ));
                              },
                            ))
            ],
          );
        });
  }

  bool isMyListEmty(PlayerAllTeamController contrloerPlr) {
    if (posTab == 0) {
      return contrloerPlr.forieginPlayerList.isEmpty;
    } else if (posTab == 1) {
      return contrloerPlr.nationalPlayerList.isEmpty;
    } else {
      return contrloerPlr.playerPlayerList.isEmpty;
    }
  }

  int myListLenght(PlayerAllTeamController contrloerTemPlr) {
    if (posTab == 0) {
      return contrloerTemPlr.forieginPlayerList.length;
    } else if (posTab == 1) {
      return contrloerTemPlr.nationalPlayerList.length;
    } else {
      return contrloerTemPlr.playerPlayerList.length;
    }
  }

  String playerName(PlayerAllTeamController contrloerTemPlr, int indexPos) {
    if (posTab == 0) {
      return contrloerTemPlr.forieginPlayerList[indexPos].player?.name ?? "";
    } else if (posTab == 1) {
      return contrloerTemPlr.nationalPlayerList[indexPos].player?.name ?? "";
    } else {
      return contrloerTemPlr.playerPlayerList[indexPos].player?.name ?? "";
    }
  }
}
