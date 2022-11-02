import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stattrack/controller/TeamDetailController.dart';
import 'package:stattrack/ui/OldMatchTeam.dart';
import 'package:stattrack/ui/match_details.dart';
import 'package:stattrack/ui/player_match_data.dart';
import 'package:stattrack/utils/LoadingWidget.dart';
import 'package:stattrack/utils/colors.dart';
import 'package:stattrack/utils/commen.dart';
import 'package:stattrack/utils/constant.dart';

import '../controller/allteamStats_controller .dart';
import '../controller/player_allteam_controller.dart';
import 'ForeginPlayerScreen.dart';
import 'UpcomingMatchTeam.dart';

class TeamDetails extends StatelessWidget {
  var teamId = "";
  TeamDetails(String this.teamId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TeamDetailController teamDetailController = Get.put(TeamDetailController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Image.asset(
              topHeaderImg2,
              height: MediaQuery.of(context).size.height * 0.35,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
            Positioned(
                left: 15,
                top: 60,
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Image.asset(
                    backIcon,
                    scale: 3,
                    height: 20,
                    width: 20,
                    color: Colors.white,
                  ),
                )),
            Column(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  margin: const EdgeInsets.only(top: 60, bottom: 15),
                  child: Image.asset(
                    teamLogo,
                    scale: 3,
                  ),
                ),
                appText("Philadelphia Eagless", txtColor: Colors.white),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
                Container(
                    color: Colors.transparent,
                    height: 50,
                    child: Obx(() => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  teamDetailController.initItem.value = 0;
                                },
                                child: Container(
                                  height: 50,
                                  alignment: Alignment.topCenter,
                                  color:
                                      teamDetailController.initItem.value == 0
                                          ? Colors.white
                                          : Colors.transparent,
                                  child: appText("Rank",
                                      txtColor:
                                          teamDetailController.initItem.value ==
                                                  0
                                              ? appBlue2
                                              : Colors.white,
                                      fontweight: FontWeight.w500,
                                      fontSize: 14),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  teamDetailController.initItem.value = 1;
                                },
                                child: Container(
                                  height: 50,
                                  alignment: Alignment.topCenter,
                                  color:
                                      teamDetailController.initItem.value == 1
                                          ? Colors.white
                                          : Colors.transparent,
                                  child: appText("Schedule",
                                      txtColor:
                                          teamDetailController.initItem.value ==
                                                  1
                                              ? appBlue2
                                              : Colors.white,
                                      fontweight: FontWeight.w500,
                                      fontSize: 14),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  teamDetailController.initItem.value = 2;
                                },
                                child: Container(
                                  height: 50,
                                  alignment: Alignment.topCenter,
                                  color:
                                      teamDetailController.initItem.value == 2
                                          ? Colors.white
                                          : Colors.transparent,
                                  child: appText("Stats",
                                      txtColor:
                                          teamDetailController.initItem.value ==
                                                  2
                                              ? appBlue2
                                              : Colors.white,
                                      fontweight: FontWeight.w500,
                                      fontSize: 14),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  teamDetailController.initItem.value = 3;
                                },
                                child: Container(
                                  height: 50,
                                  alignment: Alignment.topCenter,
                                  color:
                                      teamDetailController.initItem.value == 3
                                          ? Colors.white
                                          : Colors.transparent,
                                  child: appText("Players",
                                      txtColor:
                                          teamDetailController.initItem.value ==
                                                  3
                                              ? appBlue2
                                              : Colors.white,
                                      fontweight: FontWeight.w500,
                                      fontSize: 14),
                                ),
                              ),
                            ),
                          ],
                        ))),
                Expanded(
                    child: Obx(() => teamDetailController.initItem.value == 0
                        ? rankingView()
                        : teamDetailController.initItem.value == 1
                            ? schudleView()
                            : teamDetailController.initItem.value == 2
                                ? stateView()
                                : playerTeamView()))
              ],
            ),
          ],
        ),
      ),
    );
  }

  Column rankingView() {
    return Column(
      children: [
        // Container(
        //   height: 40,
        //   color: applightgrey,
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: [
        //       const Expanded(flex: 2, child: SizedBox()),
        //       Expanded(
        //         flex: 1,
        //         child: Center(
        //           child: appText("Offense",
        //               fontweight: FontWeight.w400, fontSize: 14),
        //         ),
        //       ),
        //       Expanded(
        //         flex: 1,
        //         child: Center(
        //           child: appText("Defence",
        //               fontweight: FontWeight.w400, fontSize: 14),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        // Expanded(
        //   child: ListView.builder(
        //     padding: const EdgeInsets.only(left: 5, top: 10, right: 5),
        //     itemCount: 5,
        //     itemBuilder: (context, index) {
        //       return Container(
        //         padding:
        //             const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
        //         child: Column(
        //           children: [
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.center,
        //               crossAxisAlignment: CrossAxisAlignment.center,
        //               children: [
        //                 Expanded(
        //                     flex: 2,
        //                     child: appText("Rushing",
        //                         fontweight: FontWeight.w500)),
        //                 Expanded(
        //                     flex: 1,
        //                     child: Center(
        //                         child: appText("23rd",
        //                             fontweight: FontWeight.w400))),
        //                 Expanded(
        //                     flex: 1,
        //                     child: Center(
        //                         child: appText("5th",
        //                             fontweight: FontWeight.w400))),
        //               ],
        //             ),
        //             Divider(
        //               thickness: 3,
        //               color: Colors.grey.shade50,
        //             )
        //           ],
        //         ),
        //       );
        //     },
        //   ),
        // )
      ],
    );
  }

  DefaultTabController schudleView() {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const TabBar(
              labelColor: appOrange,
              indicatorColor: appOrange,
              unselectedLabelColor: appBlack,
              tabs: [
                Tab(
                  text: "Old",
                ),
                Tab(
                  text: "Upcoming",
                ),
              ]),
          Expanded(
              child: TabBarView(
                  children: [OldMatchTeam(teamId), UpcomingMatchTeam(teamId)]))
        ],
      ),
    );
  }

  Widget playerView() {
    return GetX<PlayerAllTeamController>(
        init: PlayerAllTeamController(teamId),
        builder: (controllerPlayerTeam) {
          return ListView.builder(
            itemCount: 15,
            padding: EdgeInsets.only(top: 0),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // Get.to(PlayerMatchData());
                },
                child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    color: Colors.white,
                    margin: const EdgeInsets.only(top: 5, left: 10, right: 10),
                    child: SizedBox(
                      height: 80,
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(55),
                                bottomLeft:
                                    Radius.circular(55)), // Image border
                            child: Image.asset(
                              demoImage4,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          appText("Philadelphia Eagles",
                              fontweight: FontWeight.w400),
                          const SizedBox(
                            width: 80,
                          ),
                          appText("Ls", fontweight: FontWeight.w400)
                        ],
                      ),
                    )),
              );
            },
          );
        });
  }

  Widget playerTeamView() {
    return DefaultTabController(
        length: 3,
        child: Column(
          children: [
            TabBar(
                isScrollable: true,
                labelColor: appOrange,
                indicatorColor: appOrange,
                unselectedLabelColor: appBlack,
                labelStyle:
                    TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                tabs: [
                  Tab(
                    text: "ForeignPlayers",
                  ),
                  Tab(
                    text: "NationalPlayers",
                  ),
                  Tab(
                    text: "Players",
                  ),
                ]),
            Expanded(
                child: TabBarView(
              children: [
                ForeginPlayerScreen(teamId,0),
                ForeginPlayerScreen(teamId,1),
                ForeginPlayerScreen(teamId,2),
              ],
            ))
          ],
        ));
  }

  Widget stateView() {
    return DefaultTabController(
      length: 11,
      child: Column(
        children: [
          const TabBar(
              isScrollable: true,
              labelColor: appOrange,
              indicatorColor: appOrange,
              unselectedLabelColor: appBlack,
              labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              tabs: [
                Tab(
                  text: "DefensiveInterceptions",
                ),
                Tab(
                  text: "DefensiveSacks",
                ),
                Tab(
                  text: "DefensiveTotalTackles",
                ),
                Tab(
                  text: "KickingFgMade",
                ),
                Tab(
                  text: "PassingCompletionPercentage",
                ),
                Tab(
                  text: "PassingTouchdownInterceptionRatio",
                ),
                Tab(
                  text: "PassingTouchdowns",
                ),
                Tab(
                  text: "ReceivingTouchdowns",
                ),
                Tab(
                  text: "ReceivingYardsPerReception",
                ),
                Tab(
                  text: "RushingTouchdowns",
                ),
                Tab(
                  text: "RushingYardsPerAttempt",
                ),
              ]),
          Expanded(
              child: TabBarView(children: [
            for (var i = 0; i < 11; i++) ...[
              GetX<AllteamStatsController>(
                  init: AllteamStatsController(),
                  builder: (controllerStats) {
                    var itemLenght = 0;
                    if (i == 0) {
                      itemLenght = controllerStats.topPlayerList.value
                              .defensiveInterceptions?.length ??
                          0;
                      print("itemLenght1{$itemLenght}");
                    } else if (i == 1) {
                      itemLenght = controllerStats
                              .topPlayerList.value.defensiveSacks?.length ??
                          0;
                      print("itemLenght2{$itemLenght}");
                    } else if (i == 2) {
                      itemLenght = controllerStats.topPlayerList.value
                              .defensiveTotalTackles?.length ??
                          0;
                      print("itemLenght3{$itemLenght}");
                    } else if (i == 3) {
                      itemLenght = controllerStats
                              .topPlayerList.value.kickingFgMade?.length ??
                          0;
                      print("itemLenght3{$itemLenght}");
                    } else if (i == 4) {
                      itemLenght = controllerStats.topPlayerList.value
                              .passingCompletionPercentage?.length ??
                          0;
                      print("itemLenght3{$itemLenght}");
                    } else if (i == 5) {
                      itemLenght = controllerStats.topPlayerList.value
                              .passingTouchdownInterceptionRatio?.length ??
                          0;
                      print("itemLenght3{$itemLenght}");
                    } else if (i == 6) {
                      itemLenght = controllerStats
                              .topPlayerList.value.passingTouchdowns?.length ??
                          0;
                      print("itemLenght3{$itemLenght}");
                    } else if (i == 7) {
                      itemLenght = controllerStats.topPlayerList.value
                              .receivingTouchdowns?.length ??
                          0;
                      print("itemLenght3{$itemLenght}");
                    } else if (i == 8) {
                      itemLenght = controllerStats.topPlayerList.value
                              .receivingYardsPerReception?.length ??
                          0;
                      print("itemLenght3{$itemLenght}");
                    } else if (i == 9) {
                      itemLenght = controllerStats
                              .topPlayerList.value.rushingTouchdowns?.length ??
                          0;
                      print("itemLenght3{$itemLenght}");
                    } else if (i == 10) {
                      itemLenght = controllerStats.topPlayerList.value
                              .rushingYardsPerAttempt?.length ??
                          0;
                      print("itemLenght3{$itemLenght}");
                    }

                    return itemLenght == 0
                        ? LoadingWidget()
                        : Column(
                            children: [
                              Expanded(
                                child: ListView.builder(
                                  itemCount: itemLenght,
                                  padding: EdgeInsets.only(top: 0),
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
                                                    flex: 1,
                                                    // child: appText(matchStaticsList[index].groupName ??"", fontSize: 12)),
                                                    child: appText("PlayerName",
                                                        fontSize: 12)),
                                                Expanded(
                                                    // child: appText(matchStaticsList[index].groupName ??"", fontSize: 12)),
                                                    flex: 1,
                                                    child: appText(
                                                        i == 0
                                                            ? controllerStats
                                                                    .topPlayerList
                                                                    .value
                                                                    .defensiveInterceptions![
                                                                        index]
                                                                    .player
                                                                    ?.name ??
                                                                ""
                                                            : i == 1
                                                                ? controllerStats
                                                                        .topPlayerList
                                                                        .value
                                                                        .defensiveSacks![
                                                                            index]
                                                                        .player
                                                                        ?.name ??
                                                                    ""
                                                                : i == 2
                                                                    ? controllerStats
                                                                            .topPlayerList
                                                                            .value
                                                                            .defensiveTotalTackles![
                                                                                index]
                                                                            .player
                                                                            ?.name ??
                                                                        ""
                                                                    : i == 3
                                                                        ? controllerStats.topPlayerList.value.kickingFgMade![index].player?.name ??
                                                                            ""
                                                                        : i == 4
                                                                            ? controllerStats.topPlayerList.value.passingCompletionPercentage![index].player?.name ??
                                                                                ""
                                                                            : i == 5
                                                                                ? controllerStats.topPlayerList.value.passingTouchdownInterceptionRatio![index].player?.name ?? ""
                                                                                : i == 6
                                                                                    ? controllerStats.topPlayerList.value.passingTouchdowns![index].player?.name ?? ""
                                                                                    : i == 7
                                                                                        ? controllerStats.topPlayerList.value.receivingTouchdowns![index].player?.name ?? ""
                                                                                        : i == 8
                                                                                            ? controllerStats.topPlayerList.value.receivingYardsPerReception![index].player?.name ?? ""
                                                                                            : i == 9
                                                                                                ? controllerStats.topPlayerList.value.rushingTouchdowns![index].player?.name ?? ""
                                                                                                : controllerStats.topPlayerList.value.rushingYardsPerAttempt![index].player?.name ?? "",
                                                        fontSize: 12)),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 7,
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: appText(
                                                    appBarTitleItem(i,
                                                        controllerStats, index),
                                                    fontSize: 12,
                                                    fontweight: FontWeight.w500,
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: appText(
                                                      appBarItemValue(
                                                          i,
                                                          controllerStats,
                                                          index),
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 7,
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: appText(
                                                    "Appearances",
                                                    fontSize: 12,
                                                    fontweight: FontWeight.w500,
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: appText(
                                                    appearanceValue(i,
                                                        controllerStats, index),
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          );
                  })
            ]
          ]))
        ],
      ),
    );
  }

  String appBarTitleItem(
      int i, AllteamStatsController controllerStats, int index) {
    switch (i) {
      case 0:
        return "DefensiveInterceptions";
      case 1:
        return "DefensiveSacks";
      case 2:
        return "DefensiveTotalTackles";
      case 3:
        return "KickingFgMade";
      case 4:
        return "PassingCompletionPercentage";
      case 5:
        return "PassingTouchdownInterceptionRatio";
      case 6:
        return "PassingTouchdowns";
      case 7:
        return "ReceivingTouchdowns";
      case 8:
        return "ReceivingYardsPerReception";
      case 9:
        return "RushingTouchdowns";
      case 10:
        return "RushingYardsPerAttempt";
      default:
        return "N/A";
    }
  }

  String appBarItemValue(
      int i, AllteamStatsController controllerStats, int index) {
    switch (i) {
      case 0:
        return controllerStats
                .topPlayerList
                .value
                .defensiveInterceptions![index]
                .statistics
                ?.defensiveInterceptions
                .toString() ??
            "";
      case 1:
        return controllerStats.topPlayerList.value.defensiveSacks![index]
                .statistics?.defensiveSacks
                .toString() ??
            "";
      case 2:
        return controllerStats.topPlayerList.value.defensiveTotalTackles![index]
                .statistics?.defensiveTotalTackles
                .toString() ??
            "";
      case 3:
        return controllerStats.topPlayerList.value.kickingFgMade![index]
                .statistics?.kickingFgMade
                .toString() ??
            "";
      case 4:
        return (controllerStats
                    .topPlayerList
                    .value
                    .passingCompletionPercentage![index]
                    .statistics
                    ?.passingCompletionPercentage
                    ?.toStringAsFixed(2) ??
                "0.0") +
            "%";
      case 5:
        return (controllerStats
                    .topPlayerList
                    .value
                    .passingTouchdownInterceptionRatio![index]
                    .statistics
                    ?.passingTouchdownInterceptionRatio
                    ?.toStringAsFixed(2) ??
                "0.0") +
            "%";
      case 6:
        return controllerStats.topPlayerList.value.passingTouchdowns![index]
                .statistics?.passingTouchdowns
                .toString() ??
            "";
      case 7:
        return controllerStats.topPlayerList.value.receivingTouchdowns![index]
                .statistics?.receivingTouchdowns
                .toString() ??
            "";
      case 8:
        return (controllerStats
                .topPlayerList
                .value
                .receivingYardsPerReception![index]
                .statistics
                ?.receivingYardsPerReception
                ?.toStringAsFixed(2) ??
            "0.0");
      case 9:
        return controllerStats.topPlayerList.value.rushingTouchdowns![index]
                .statistics?.rushingTouchdowns
                .toString() ??
            "";
      case 10:
        return (controllerStats
                .topPlayerList
                .value
                .rushingYardsPerAttempt![index]
                .statistics
                ?.rushingYardsPerAttempt
                ?.toStringAsFixed(2) ??
            "");

      default:
        return "";
    }
  }

  String appearanceValue(
      int i, AllteamStatsController controllerStats, int index) {
    switch (i) {
      case 0:
        return controllerStats.topPlayerList.value
                .defensiveInterceptions![index].statistics?.appearances
                .toString() ??
            "";

      case 1:
        return controllerStats.topPlayerList.value.defensiveSacks![index]
                .statistics?.appearances
                .toString() ??
            "";
      case 2:
        return controllerStats.topPlayerList.value.defensiveTotalTackles![index]
                .statistics?.appearances
                .toString() ??
            "";
      case 3:
        return controllerStats.topPlayerList.value.kickingFgMade![index]
                .statistics?.appearances
                .toString() ??
            "";
      case 4:
        return controllerStats.topPlayerList.value
                .passingCompletionPercentage![index].statistics?.appearances
                .toString() ??
            "";
      case 5:
        return controllerStats
                .topPlayerList
                .value
                .passingTouchdownInterceptionRatio![index]
                .statistics
                ?.appearances
                .toString() ??
            "";
      case 6:
        return controllerStats.topPlayerList.value.passingTouchdowns![index]
                .statistics?.appearances
                .toString() ??
            "";
      case 7:
        return controllerStats.topPlayerList.value.receivingTouchdowns![index]
                .statistics?.appearances
                .toString() ??
            "";
      case 8:
        return controllerStats.topPlayerList.value
                .receivingYardsPerReception![index].statistics?.appearances
                .toString() ??
            "";
      case 9:
        return controllerStats.topPlayerList.value.rushingTouchdowns![index]
                .statistics?.appearances
                .toString() ??
            "";

      case 10:
        return controllerStats.topPlayerList.value
                .rushingYardsPerAttempt![index].statistics?.appearances
                .toString() ??
            "";

      default:
        return "N/A";
    }
  }
}
