

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stattrack/model/matchstats_model.dart';

import '../utils/commen.dart';

class MatchStats extends StatelessWidget {
  RxList<Groups> matchStaticsList;
  RxBool isHome;
  MatchStats(this.matchStaticsList, this.isHome, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print("matchIdd>>${isHome.value}");
        return ListView.builder(
          itemCount: matchStaticsList.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.all(5),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: appText(matchStaticsList[index].groupName ??"", fontSize: 12)),
                      ],
                    ),
                    SizedBox(height: 7,),
                    Container(
                      width: double.infinity,
                      height: 35,
                      child: innerList(matchStaticsList[index].statisticsItems,isHome.value),)
                  ],
                ),
              ),
            );
          },
        );



  }

  innerList(List<StatisticsItems>? statisticsItems, bool isFromHomeTeam) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: statisticsItems?.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Column(
              children: [
                appText(statisticsItems?[index].name ?? "", fontSize: 12,fontweight: FontWeight.w500, textAlign: TextAlign.center),
                const SizedBox(
                  height: 4,
                ),
                appText(isFromHomeTeam ?  statisticsItems![index].home ?? "" :  statisticsItems![index].away ?? "", fontSize: 12,textAlign: TextAlign.center)
               // Text(isFromHomeTeam ?  statisticsItems![index].home ?? "" :  statisticsItems![index].away ?? "" ,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w600), ),

              ],
            ),
          );
    });

  }
}
