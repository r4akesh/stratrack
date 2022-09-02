

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stattrack/utils/colors.dart';

import '../utils/commen.dart';
import '../utils/constant.dart';

class PlayerMatchData  extends StatelessWidget {
  const  PlayerMatchData ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:appBar() ,
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20,),
            CircleAvatar(
              radius: 50,
              backgroundColor: appBlue,
              child: Padding(
                padding: const EdgeInsets.all(2), // Border radius
                child: ClipOval(child: Image.asset(demoImage)),
              ),
            ),
            const SizedBox(height: 20,),
            appText("Philadelphia Eagles",txtColor: Colors.black),
            Expanded(
              child: DefaultTabController(length: 3, child: Column(
                children:   [
                  const TabBar(
                    indicatorColor: appOrange,
                      labelColor: appOrange,
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
                  SizedBox(height: 10,),
                  Expanded(child: TabBarView(
                    children: [
                      ListView.builder(itemBuilder: (context, index) {
                        return  Card(
                          elevation: 0,
                          margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 2),
                          child: Container(
                             margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                            child: Row(children: [
                              Image.asset(teamIcon,scale: 3.5,),
                              const SizedBox(width: 10,),
                              appText("Dallas Cowboys",fontSize: 15,fontweight: FontWeight.w500)
                            ],),
                          ),
                        );
                      },),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  radius: 40,
                                  backgroundColor: appBlue,
                                  child: Padding(
                                    padding: const EdgeInsets.all(2), // Border radius
                                    child: ClipOval(child: Image.asset(demoImage)),
                                  ),
                                ),
                                appText("VS",fontweight: FontWeight.w600,fontSize: 28),
                                CircleAvatar(
                                  radius: 40,
                                  backgroundColor: appBlue,
                                  child: Padding(
                                    padding: const EdgeInsets.all(2), // Border radius
                                    child: ClipOval(child: Image.asset(demoImage)),
                                  ),
                                ),

                              ],),
                          ),
                          const Divider(thickness: 1.2,color: appTextGrey,indent: 10,endIndent: 10,),
                          Expanded(
                            child: DefaultTabController(
                              length: 4,
                              child: Column(
                                children:   [
                                  const TabBar(
                                      labelColor: appOrange,
                                      indicatorColor: appOrange,
                                      unselectedLabelColor: appBlack,
                                      labelStyle: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600
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
                                      child:  TabBarView(children: [
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
                                                  itemCount: 1,
                                                  itemBuilder: (context, index) {
                                                    return Card(
                                                      elevation: 0,
                                                      margin: EdgeInsets.all(2),
                                                      child: Padding(
                                                        padding: const EdgeInsets.symmetric(
                                                            horizontal: 5, vertical: 20),
                                                        child: Row(
                                                          children: [
                                                            Expanded(
                                                                flex: 2,
                                                                child: GestureDetector(
                                                                  onTap: (){

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
                          )
                        ],
                      ),
                      ListView.builder(itemBuilder: (context, index) {
                        return  Card(
                          elevation: 0,
                          margin: EdgeInsets.symmetric(horizontal: 5,vertical: 2),
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                            child: Row(children: [
                              Image.asset(teamIcon,scale: 3.5,),
                              SizedBox(width: 10,),
                              appText("Dallas Cowboys",fontSize: 15,fontweight: FontWeight.w500)
                            ],),
                          ),
                        );
                      },),
                    ],
                  ))
                ],
              )),
            )
          ],
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      toolbarHeight: 100,
      title: appText(
        "Player states",
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
