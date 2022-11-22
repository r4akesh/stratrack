import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stattrack/controller/UpcomingMatchController.dart';
import 'package:stattrack/ui/LiveMatch.dart';
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
              LiveMatch(),
              UpcomingMatch(),
            ]))
          ],
        ),
      ),
    );

   
  }
}
