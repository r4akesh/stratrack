import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stattrack/ui/player_record.dart';
import 'package:stattrack/ui/team_details.dart';
import 'package:stattrack/utils/colors.dart';

import '../utils/commen.dart';
import '../utils/constant.dart';

class MatchDetails extends StatelessWidget {
  var from = "";

  MatchDetails({Key? key, required this.from}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                Column(
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
                    appText("Philadelphia Eagles")
                  ],
                ),
                appText("VS"),
                Column(
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
                    appText("Philadelphia Eagles")
                  ],
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
              child: DefaultTabController(
                length: 4,
                child: Column(
                  children: [
                    const TabBar(
                        labelColor: appOrange,
                        indicatorColor: appOrange,
                        unselectedLabelColor: appBlack,
                        labelStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500
                        ),
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
                          for(var i=0;i<4;i++)...[
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  height: 25,
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
                                                  fontweight: FontWeight.w400,
                                                  fontSize: 12)),
                                        )
                                      ]
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: ListView.builder(
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
                                )
                              ],
                            ),
                          ]


                    ]))
                  ],
                ),
              ),
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
