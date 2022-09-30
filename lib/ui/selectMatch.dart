import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stattrack/controller/UpcomingMatchController.dart';
import 'package:stattrack/ui/OldMatch.dart';
import 'package:stattrack/ui/match_details.dart';
import 'package:stattrack/utils/colors.dart';
import 'package:stattrack/utils/commen.dart';
import 'package:stattrack/utils/constant.dart';

import 'UpComingMatch.dart';

class SelectMatch extends StatelessWidget {
  const SelectMatch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // UpcomingMatchController upcomingMatchController = Get.put(UpcomingMatchController());

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: true,
        leading:   IconButton(
          icon:   Image.asset(
            backIconWhite,
            scale: 3,
            height: 20,
            width: 20,
          ),
          onPressed: () => Navigator.of(context).pop()),
        actions: [
          const Icon(
            Icons.search_outlined,
            size: 30,
          ),
          Container(
            width: 10,
          )
        ],
        title: appText("Select match", txtColor: Colors.white),
        flexibleSpace: Image.asset(
          topHeaderImg,
          fit: BoxFit.fill,
        ),
      ),
      body: DefaultTabController(
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
             OldMatch(),
              ListView.builder(itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                   // Get.to(MatchDetails(from: "Live"));
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
                                  txtColor: appBlack),
                              Spacer(),
                              appText("8:00pm",
                                  fontweight: FontWeight.w400,
                                  txtColor: appBlack),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 15, bottom: 10, left: 10, right: 10),
                          child: Row(
                            children: [
                              appText("Philadelphia Eagles",
                                  fontweight: FontWeight.w400, fontSize: 14),
                              const SizedBox(
                                width: 10,
                              ),
                              appText("VS",
                                  fontweight: FontWeight.w600, fontSize: 14),
                              const SizedBox(
                                width: 10,
                              ),
                              appText("Philadelphia Eagles",
                                  fontweight: FontWeight.w400, fontSize: 14),
                            ],
                          ),
                        ),
                        Container(
                            alignment: Alignment.bottomRight,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: appText("Hard rock stadium",
                                fontweight: FontWeight.w400,
                                fontSize: 14,
                                txtColor: appLightBlue))
                      ],
                    ),
                  ),
                );
              }),
              UpcomingMatch(),
            ]))
          ],
        ),
      ),
    );

    ;
  }
}
