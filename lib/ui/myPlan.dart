import 'package:flutter/material.dart';
import 'package:stattrack/utils/colors.dart';
import 'package:stattrack/utils/commen.dart';
import 'package:stattrack/utils/constant.dart';

class MyPlan extends StatelessWidget {
  const MyPlan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const TabBar(
                labelColor: appOrange,
                unselectedLabelColor: appBlack,
                indicatorColor: appOrange,
                physics: AlwaysScrollableScrollPhysics(),
                labelStyle: TextStyle(color: appOrange),
                tabs: [
                  Tab(
                    text: "Active plan",
                  ),
                  Tab(
                    text: "Expired plan",
                  )
                ]),
            Expanded(
              child: TabBarView(children: [
                Card(
                  margin: const EdgeInsets.all(20),
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Container(
                        height: 30,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: const BoxDecoration(
                            color: applightBlueGrey,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                topLeft: Radius.circular(10))),
                        child: appText("From: 20 Jun 2022  to  19 JULY 2022",txtColor: Colors.black54,fontweight: FontWeight.w300,fontSize: 14),
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: 50,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 8),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      forwordIcon,
                                      scale: 3,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Flexible(
                                      child: appText("Package 500/Month",
                                          fontweight: FontWeight.w400,
                                          fontSize: 14),
                                    )
                                  ],
                                ),
                              );
                            }),
                      ),
                      Container(
                        height: 40,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            color: appTextGrey,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10))),
                        child: appText("Will be expired on 19/ 07 /22",txtColor: Colors.white,fontweight: FontWeight.w400,fontSize: 14),
                      )
                    ],
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(20),
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Container(
                        height: 30,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: const BoxDecoration(
                            color: applightBlueGrey,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                topLeft: Radius.circular(10))),
                        child: appText("From: 20 Jun 2022  to  19 JULY 2022",txtColor: Colors.black54,fontweight: FontWeight.w300,fontSize: 14),
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: 50,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 8),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      forwordIcon,
                                      scale: 3,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Flexible(
                                      child: appText("Package 500/Month",
                                          fontweight: FontWeight.w400,
                                          fontSize: 14),
                                    )
                                  ],
                                ),
                              );
                            }),
                      ),
                      Container(
                        height: 40,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            color: appTextGrey,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10))),
                        child: appText("Will be expired on 19/ 07 /22",txtColor: Colors.white,fontweight: FontWeight.w400,fontSize: 14),
                      )
                    ],
                  ),
                ),
              ]),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
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
        "My plan",
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
