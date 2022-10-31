import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stattrack/controller/TeamDetailController.dart';
import 'package:stattrack/ui/OldMatchTeam.dart';
import 'package:stattrack/ui/match_details.dart';
import 'package:stattrack/ui/player_match_data.dart';
import 'package:stattrack/utils/colors.dart';
import 'package:stattrack/utils/commen.dart';
import 'package:stattrack/utils/constant.dart';

class TeamDetails extends StatelessWidget {
  var teamId="";
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
                                : playerView()))
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
        Container(
          height: 40,
          color: applightgrey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Expanded(flex: 2, child: SizedBox()),
              Expanded(
                flex: 1,
                child: Center(
                  child: appText("Offense",
                      fontweight: FontWeight.w400, fontSize: 14),
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: appText("Defence",
                      fontweight: FontWeight.w400, fontSize: 14),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 5, top: 10, right: 5),
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                padding:
                    const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            flex: 2,
                            child: appText("Rushing",
                                fontweight: FontWeight.w500)),
                        Expanded(
                            flex: 1,
                            child: Center(
                                child: appText("23rd",
                                    fontweight: FontWeight.w400))),
                        Expanded(
                            flex: 1,
                            child: Center(
                                child: appText("5th",
                                    fontweight: FontWeight.w400))),
                      ],
                    ),
                    Divider(
                      thickness: 3,
                      color: Colors.grey.shade50,
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }

  DefaultTabController schudleView() {
    return DefaultTabController(
      length: 3,
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
                  text: "Live",
                ),
                Tab(
                  text: "Upcoming",
                ),
              ]),
          Expanded(
              child: TabBarView(children: [
            OldMatchTeam(teamId),
          
            ListView.builder(
                padding: const EdgeInsets.only(top: 0),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(MatchDetails(from: "Live"));
                    },
                    child: Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Column(
                        children: [
                          Container(
                            height: 40,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            color: applightgrey,
                            child: Row(
                              children: [
                                appText("Saturday, August 10, 2019",
                                    fontweight: FontWeight.w400,
                                    txtColor: appBlack,
                                    fontSize: 14),
                                const Spacer(),
                                appText("Pre WK 1",
                                    fontweight: FontWeight.w400,
                                    txtColor: Colors.black26,
                                    fontSize: 14),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                top: 15, bottom: 10, left: 10, right: 10),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                appText("VS",
                                    fontweight: FontWeight.w600, fontSize: 14),
                                const SizedBox(
                                  width: 10,
                                ),
                                Image.asset(
                                  teamIcon,
                                  scale: 3,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                appText("Philadelphia Eagles",
                                    fontweight: FontWeight.w400, fontSize: 14),
                                const Spacer(),
                                appText("W 17-9",
                                    fontweight: FontWeight.w400, fontSize: 14),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          
            ListView.builder(
                padding: const EdgeInsets.only(top: 0),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(MatchDetails(from: "Upcoming"));
                    },
                    child: Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: Column(
                        children: [
                          Container(
                            height: 40,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            color: applightgrey,
                            child: Row(
                              children: [
                                appText("Saturday, August 10, 2019",
                                    fontweight: FontWeight.w400,
                                    txtColor: appBlack,
                                    fontSize: 14),
                                const Spacer(),
                                appText("Pre WK 1",
                                    fontweight: FontWeight.w400,
                                    txtColor: Colors.black26,
                                    fontSize: 14),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                top: 15, bottom: 10, left: 10, right: 10),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                appText("VS",
                                    fontweight: FontWeight.w600, fontSize: 14),
                                const SizedBox(
                                  width: 10,
                                ),
                                Image.asset(
                                  teamIcon,
                                  scale: 3,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                appText("Philadelphia Eagles",
                                    fontweight: FontWeight.w400, fontSize: 14),
                                const Spacer(),
                                appText("W 17-9",
                                    fontweight: FontWeight.w400, fontSize: 14),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ]))
        ],
      ),
    );
  }

  Widget stateView() {
    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          const TabBar(
              labelColor: appOrange,
              indicatorColor: appOrange,
              unselectedLabelColor: appBlack,
              labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              tabs: [
                Tab(
                  text: "Kicking",
                ),
                Tab(
                  text: "Passing",
                ),
                Tab(
                  text: "Receiving",
                ),
                Tab(
                  text: "Defense",
                ),
              ]),
          Expanded(
              child: TabBarView(children: [
            for (var i = 0; i < 4; i++) ...[
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    height: 30,
                    color: applightgrey,
                    child: Row(
                      children: [
                        Expanded(flex: 2, child: SizedBox()),
                        for (var i = 0; i < 6; i++) ...[
                          Expanded(
                            child: Container(
                                width: 40,
                                alignment: Alignment.center,
                                child: appText("Gp",
                                    fontweight: FontWeight.w400, fontSize: 12)),
                          )
                        ]
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 10,
                      padding: EdgeInsets.only(top: 0),
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
                                      onTap: () {},
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
                  )
                ],
              ),
            ]
          ]))
        ],
      ),
    );
  }

  ListView playerView() {
    return ListView.builder(
      itemCount: 15,
      padding: EdgeInsets.only(top: 0),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Get.to(PlayerMatchData());
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
                          bottomLeft: Radius.circular(55)), // Image border
                      child: Image.asset(
                        demoImage4,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    appText("Philadelphia Eagles", fontweight: FontWeight.w400),
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
  }
}
