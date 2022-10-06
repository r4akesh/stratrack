

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:stattrack/controller/playerDetailController.dart';
import 'package:stattrack/main.dart';

import '../model/myDashboard.dart';
import '../utils/colors.dart';
import '../utils/commen.dart';
import '../utils/constant.dart';

class PlayerRecord extends StatelessWidget {
  int plrId;
    PlayerRecord(this.plrId, {Key? key}) : super(key: key);
  //final box = Hive.box('boxName');
   var plrDetailController = Get.put(PlayerDetailController());
  @override
  Widget build(BuildContext context) {

    plrDetailController.plrDetailAPICall(plrId);
    List<UserData> listUd= <UserData>[];
    return Scaffold(
    body: Stack(
      children: [
        Image.asset(topHeaderImg2,   fit: BoxFit.fill,),
        Positioned(left:15,top: 50,child: GestureDetector(
            onTap: (){
              Get.back();
            },
            child: Image.asset(backIcon,scale: 3,color: Colors.white,width: 20,height: 20,))),
        Padding(padding: EdgeInsets.only(top: 60),
          child: Column(children: [
           // appText("Action",txtColor: Colors.white),
            const SizedBox(height: 25,),
            Container( alignment: Alignment.topCenter,child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(3), // Border radius
                child: ClipOval(child: Image.asset(demoImage)),
              ),
            ),),
            const SizedBox(height: 20,),
            appText("Philadelphia Eagles",txtColor: Colors.white),
            appText("countery name",txtColor: Colors.white,fontSize: 14),
            const SizedBox(height: 20,),
           /* Expanded(
              child: DefaultTabController(
                length: 4,
                child: Column(
                  children: [
                    const TabBar(
                        labelColor: appOrange,
                        indicatorColor: Colors.transparent,
                        unselectedLabelColor: appBlack,
                        indicatorSize: TabBarIndicatorSize.label,

                        labelStyle: TextStyle(
                          fontSize: 14,

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
                        child: TabBarView(
                            children: [
                          for(var i=0;i<4;i++)...[
                            Expanded(
                              child: ListView.builder(
                                padding: EdgeInsets.all(0),
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                  return Container(
                                    color: applightgrey,
                                    margin: const EdgeInsets.only(left: 5,right: 5,bottom: 5),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          appText("Gp",fontweight: FontWeight.w400,fontSize: 14),
                                          appText("2",fontweight: FontWeight.w400,fontSize: 14),
                                          GestureDetector(
                                              onTap: () async {
                                                UserData ud = UserData("Player1","2");
                                                listUd.add(ud);
                                                MyApp.box.write(KEY_DASHBOARD_LIST, jsonEncode(listUd));
                                                var fetchData = MyApp.box.read(KEY_DASHBOARD_LIST);
                                                print(fetchData);
                                                toast("Record added in your dashboard");
                                                },
                                              child: Image.asset(addIcon,scale: 3.2,))
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          ]

                        ]))
                  ],
                ),
              ),
            ),*/
            Padding(
              padding: EdgeInsets.all(10),
              child: Align(alignment: Alignment.centerLeft,
                  child: appText("Personal Information",txtColor: Colors.black, textAlign: TextAlign.start,fontweight: FontWeight.normal)),
            ),
            Column(children: [
              rowPersonal("DOB","26 july"),
              rowPersonal("Height","26 july"),
              rowPersonal("Position","26 july"),
              rowPersonal("Team Name","26 july"),




            ],)

          ],),
        ),

      ],
    ),
    );
  }

  Widget rowPersonal(String s1, String s2){
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Container(
        color: Colors.white,
        child: Row(children: [
          Expanded(
              flex:1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: appText(s1,txtColor: Colors.black, textAlign: TextAlign.start,fontweight: FontWeight.normal,fontSize: 14),
              )),
          Expanded(
              flex: 2,
              child: appText(s2,txtColor: Colors.black, textAlign: TextAlign.start,fontweight: FontWeight.normal,fontSize: 14))
        ],),
      ),
    );
  }
}
