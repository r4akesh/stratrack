import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:stattrack/controller/DashboardController.dart';
import 'package:stattrack/main.dart';
import 'package:stattrack/model/matchdetail_model.dart';
import 'package:stattrack/ui/myPlan.dart';
import 'package:stattrack/ui/profileEdit.dart';
import 'package:stattrack/ui/selectMatch.dart';
import 'package:stattrack/ui/team_details.dart';
import 'package:stattrack/ui/welcome.dart';
import 'package:stattrack/utils/colors.dart';
import 'package:stattrack/utils/commen.dart';
import 'package:stattrack/utils/constant.dart';
import '../model/myDashboard.dart';
import '../utils/string.dart';
import 'allteam.dart';
import 'notifaction.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  //final globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
        init: DashboardController(),
        builder: (value) => Scaffold(
              drawer: drawer(context, value),
              appBar: value.initialItemSelected == 0
                  ? appBar("Select game", true, value, context)
                  : value.initialItemSelected == 1
                      ? appBarDashboard("Dashboard", false)
                      : value.initialItemSelected == 2
                          ? appBarTeam("Select Team", false)
                          : appBarProfile(),
              bottomNavigationBar: bottomNavigation(value),
              body: value.initialItemSelected == 0
                  ? homeView(context)
                  : value.initialItemSelected == 1
                      ? dashboardView()
                      : value.initialItemSelected == 2
                          ? Allteam()
                          : profileView(context),
            ));
  }

  Container drawer(BuildContext context, DashboardController value) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.21,
            child: Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: Image.asset(
                    sideNavHeader,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                    top: MediaQuery.of(context).size.height * 0.10,
                    left: 1,
                    right: 1,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 40,
                      child: ClipOval(
                        child: SizedBox.fromSize(
                          size: const Size.fromRadius(39),
                          child: MyApp.box.read("imageUrl") != null
                              ? Image.network(
                                  MyApp.box.read("imageUrl"),
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  "https://alliancebjjmn.com/wp-content/uploads/2019/07/placeholder-profile-sq.jpg"),
                        ),
                      ),
                    ))
              ],
            ),
          ),
          ListTile(
            onTap: () {
              Get.to(Notifaction());
            },
            horizontalTitleGap: 10,
            title: appText(notifaction,
                fontSize: 14,
                txtColor: appTextGrey,
                fontweight: FontWeight.w400),
            leading: Image.asset(
              navNotifactionIcon,
              scale: 3,
            ),
            contentPadding: EdgeInsets.only(left: 10, right: 0),
            minLeadingWidth: 5,
            trailing: Container(
              width: 45,
              height: 25,
              margin: EdgeInsets.only(right: 15),
              child: FlutterSwitch(
                value: value.isNotificationOn.value,
                toggleSize: 20,
                onToggle: (bool boolValue) {
                  //value.isNotificationOn.value = boolValue;
                  value.setNotification(boolValue);
                },
              ),
            ),
          ),
          const Divider(
            thickness: 0.5,
            color: appTextGrey,
            indent: 10,
            endIndent: 15,
            height: 0,
          ),
          ListTile(
            onTap: () {
              Get.to(const MyPlan());
            },
            horizontalTitleGap: 10,
            title: appText(myPlan,
                fontSize: 14,
                txtColor: appTextGrey,
                fontweight: FontWeight.w400),
            leading: Image.asset(
              sideNavPlanIcon,
              scale: 3,
            ),
            contentPadding: EdgeInsets.only(left: 10, right: 0),
            minLeadingWidth: 5,
          ),
          const Divider(
            thickness: 0.5,
            color: appTextGrey,
            indent: 10,
            height: 0,
            endIndent: 15,
          ),
          ListTile(
            horizontalTitleGap: 10,
            title: appText(invitePeople,
                fontSize: 14,
                txtColor: appTextGrey,
                fontweight: FontWeight.w400),
            leading: Image.asset(
              inviteUser,
              scale: 3,
            ),
            contentPadding: EdgeInsets.only(left: 10, right: 0),
            minLeadingWidth: 5,
          ),
          const Divider(
            thickness: 0.5,
            color: appTextGrey,
            height: 0,
            indent: 10,
            endIndent: 15,
          ),
          ListTile(
            onTap: () {
              MyApp.box.remove("id");
              Get.off(Welcome());
            },
            horizontalTitleGap: 10,
            title: appText(logout,
                fontSize: 14,
                txtColor: appTextGrey,
                fontweight: FontWeight.w400),
            leading: Image.asset(
              logoutIcon,
              scale: 3,
            ),
            contentPadding: EdgeInsets.only(left: 10, right: 0),
            minLeadingWidth: 5,
          ),
          const Divider(
            thickness: 0.5,
            color: appTextGrey,
            indent: 10,
            endIndent: 15,
            height: 0,
          ),
        ],
      ),
    );
  }

  AppBar appBarDashboard(String title, bool isimplLeading) {
    return AppBar(
      title: Image.asset(
        appLogo,
        scale: 3.5,
      ),
      backgroundColor: appBlue,
      toolbarHeight: 200,
      centerTitle: true,
      automaticallyImplyLeading: isimplLeading,
      elevation: 2,
      toolbarTextStyle: TextStyle(color: Colors.white),
      titleTextStyle: const TextStyle(
        color: Colors.white,
      ),
      flexibleSpace: Container(
        child: Image.asset(
          topHeaderImg2,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  AppBar appBar(String title, bool isimplLeading, DashboardController value,
      BuildContext ctxx) {
    return AppBar(
      title: appText(title, txtColor: Colors.white),
      backgroundColor: appBlue,
      toolbarHeight: 100,
      centerTitle: true,
      automaticallyImplyLeading: isimplLeading,
      elevation: 2,
      //leading: IconButton(icon: Image.asset(icHumburger,height: 24,),onPressed: () => Scaffold.of(ctxx).openDrawer()),
      //leading: IconButton(icon: Image.asset(icHumburger,height: 24,),onPressed: () => globalKey.currentState?.openDrawer()),

      toolbarTextStyle: TextStyle(color: Colors.white),
      titleTextStyle: const TextStyle(
        color: Colors.white,
      ),
      flexibleSpace: Container(
        child: Image.asset(
          topHeaderImg,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  AppBar appBarTeam(String title, bool isimplLeading) {
    return AppBar(
      title: appText(title, txtColor: Colors.white),
      backgroundColor: appBlue,
      toolbarHeight: 100,
      // actions: [
      //   Icon(Icons.search),
      //   Container(
      //     width: 10,
      //   )
      // ],
      centerTitle: true,
      automaticallyImplyLeading: isimplLeading,
      elevation: 2,
      toolbarTextStyle: TextStyle(color: Colors.white),
      titleTextStyle: const TextStyle(
        color: Colors.white,
      ),
      flexibleSpace: Container(
        child: Image.asset(
          topHeaderImg,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  AppBar appBarProfile() {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 150,
      elevation: 0,
      flexibleSpace: Container(
        child: Stack(
          children: [
            Image.asset(
              topHeaderImg,
              fit: BoxFit.fill,
              height: 200,
            ),
            Align(
              alignment: Alignment.centerLeft,
              heightFactor: 1000,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 40,
                    child: ClipOval(
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(39),
                        child: MyApp.box.read("imageUrl") != null
                            ? Image.network(
                                MyApp.box.read("imageUrl"),
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                "https://alliancebjjmn.com/wp-content/uploads/2019/07/placeholder-profile-sq.jpg"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyApp.box.read("firstName") != null
                          ? appText(
                              MyApp.box.read("firstName") +
                                  " " +
                                  MyApp.box.read("lastName"),
                              txtColor: Colors.white,
                            )
                          : appText(
                              "",
                              txtColor: Colors.white,
                            ),
                      MyApp.box.read("email") != null
                          ? appText(MyApp.box.read("email"),
                              txtColor: appLightBlue,
                              fontweight: FontWeight.w400,
                              fontSize: 14)
                          : appText("",
                              txtColor: appLightBlue,
                              fontweight: FontWeight.w400,
                              fontSize: 14)
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container bottomNavigation(DashboardController dashboardController) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            offset: Offset(0, 1),
            blurRadius: 5)
      ]),
      height: 70,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                dashboardController.setBottomNav(0);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    navHomeIcon,
                    scale: 2.5,
                    color: dashboardController.initialItemSelected == 0
                        ? appOrange
                        : appTextGrey,
                  ),
                  appText(home,
                      fontweight: FontWeight.w300,
                      txtColor: dashboardController.initialItemSelected == 0
                          ? appOrange
                          : appTextGrey,
                      fontSize: 13)
                ],
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                dashboardController.setBottomNav(1);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    navDashboard,
                    scale: 2.5,
                    color: dashboardController.initialItemSelected == 1
                        ? appOrange
                        : appTextGrey,
                  ),
                  appText(dashboard,
                      fontweight: FontWeight.w300,
                      txtColor: dashboardController.initialItemSelected == 1
                          ? appOrange
                          : appTextGrey,
                      fontSize: 13)
                ],
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                dashboardController.setBottomNav(2);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    navTeamIcon,
                    scale: 2.5,
                    color: dashboardController.initialItemSelected == 2
                        ? appOrange
                        : appTextGrey,
                  ),
                  appText(team,
                      fontweight: FontWeight.w300,
                      txtColor: dashboardController.initialItemSelected == 2
                          ? appOrange
                          : appTextGrey,
                      fontSize: 13)
                ],
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                dashboardController.setBottomNav(3);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    navProfileIcon,
                    scale: 2.5,
                    color: dashboardController.initialItemSelected == 3
                        ? appOrange
                        : appTextGrey,
                  ),
                  appText(profile,
                      fontweight: FontWeight.w300,
                      txtColor: dashboardController.initialItemSelected == 3
                          ? appOrange
                          : appTextGrey,
                      fontSize: 13)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget profileView(BuildContext context) {
    return GetBuilder<DashboardController>(
        id: "profileLoading",
        builder: (contrler) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: appText("First name",
                            fontweight: FontWeight.w400,
                            fontSize: 16,
                            txtColor: appTextGrey)),
                    Expanded(
                        child: Align(
                            alignment: Alignment.topRight,
                            child: MyApp.box.read("firstName") != null
                                ? appText(
                                    MyApp.box.read("firstName"),
                                    fontweight: FontWeight.w400,
                                    fontSize: 16,
                                  )
                                : appText(""))),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  thickness: 1,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                        child: appText("Last name",
                            fontweight: FontWeight.w400,
                            fontSize: 16,
                            txtColor: appTextGrey)),
                    Expanded(
                        child: Align(
                            alignment: Alignment.topRight,
                            child: MyApp.box.read("lastName") != null
                                ? appText(
                                    MyApp.box.read("lastName"),
                                    fontweight: FontWeight.w400,
                                    fontSize: 16,
                                  )
                                : appText(""))),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  thickness: 1,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                        child: appText("Email",
                            fontweight: FontWeight.w400,
                            fontSize: 16,
                            txtColor: appTextGrey)),
                    Expanded(
                        child: Align(
                            alignment: Alignment.topRight,
                            child: MyApp.box.read("email") != null
                                ? appText(
                                    MyApp.box.read("email"),
                                    fontweight: FontWeight.w400,
                                    fontSize: 16,
                                  )
                                : appText(""))),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  thickness: 1,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                        child: appText("Password",
                            fontweight: FontWeight.w400,
                            fontSize: 16,
                            txtColor: appTextGrey)),
                    Expanded(
                        child: Align(
                            alignment: Alignment.topRight,
                            child: Image.asset(
                              password_dot,
                              scale: 3,
                            ))),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  thickness: 1,
                ),
                const SizedBox(
                  height: 40,
                ),
                GestureDetector(
                    onTap: () {
                      Get.to(ProfileEdit());
                    },
                    child: appButton(context, "Edit", 60, appOrange))
              ],
            ),
          );
        });
  }

  Widget homeView(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              var vv = index;
              if (index == 0) {
                Get.to(const SelectMatch());
              } else if (index == 1) {
                showMyAlert(context, "Coming Soon...");
              } else if (index == 2) {
                showMyAlert(context, "Coming Soon...");
              }
            },
            child: Card(
              margin: EdgeInsets.all(10),
              elevation: 5,
              child: Stack(
                children: [
                  Image.asset(bgImag),
                  Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 20,
                      child: index == 0
                          ? Image.asset(
                              nflBallIcon,
                              scale: 3,
                            )
                          : index == 1
                              ? Image.asset(
                                  nflBaseball,
                                  scale: 3,
                                )
                              : Image.asset(
                                  nflHockey,
                                  scale: 3,
                                )),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      color: appOrange,
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      child: appText(
                          index == 0
                              ? "Football"
                              : index == 1
                                  ? "Baseball"
                                  : "Hockey",
                          txtColor: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  // Widget teamView() {
  Widget dashboardView() {
    try {
      var plrrecord = jsonDecode(MyApp.box.read(PLAYER_RECORD));
      List<Players> listUd2 =
          List.from(plrrecord.map((e) => Players.fromJson(e)));
      print("listSize${listUd2.length}");
      return listUd2.length > 0
          ? ListView.builder(
              itemCount: listUd2.length,
              itemBuilder: (context, index) {
                final item = listUd2[index];
                final plyrId = item.player?.id;
                return Dismissible(
                  key: Key(item.player?.name ?? ""),
                  onDismissed: ((direction) {
                    setState(() {
                      listUd2.removeAt(index);
                      print("size${listUd2.length}");
                      print("index${index}");
                      String jsonString = jsonEncode(listUd2);
                      MyApp.box.write(PLAYER_RECORD, jsonString);
                    });
                  }),
                  child: Card(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              FadeInImage(
                                  width: double.infinity,
                                  height: 100,
                                  image: NetworkImage(
                                      "https://allsportsapi2.p.rapidapi.com/api/american-football/player/$plyrId/image",
                                      headers: const {
                                        "X-RapidAPI-Key": RAPID_API_KEY,
                                        "X-RapidAPI-Host":
                                            "allsportsapi2.p.rapidapi.com"
                                      }),
                                  placeholder: AssetImage(appLogo)),
                              Positioned(
                                  bottom: 10,
                                  child: appText(item.player?.name ?? "",
                                      txtColor: Colors.black))
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                        flex: 2,
                                        child: appText("Kick Returns Total",
                                            fontweight: FontWeight.w400,
                                            fontSize: 14)),
                                    Expanded(
                                        flex: 2,
                                        child: appText(".............",
                                            txtColor: appTextGrey)),
                                    Expanded(
                                        flex: 1,
                                        child: appText(
                                            item.statistics!.kickReturnsTotal ==
                                                    null
                                                ? "0"
                                                : item.statistics!
                                                    .kickReturnsTotal
                                                    .toString(),
                                            fontweight: FontWeight.w400,
                                            fontSize: 14)),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                        flex: 2,
                                        child: appText("Passing yard",
                                            fontweight: FontWeight.w400,
                                            fontSize: 14)),
                                    Expanded(
                                        flex: 2,
                                        child: appText(".............",
                                            txtColor: appTextGrey)),
                                    Expanded(
                                        flex: 1,
                                        child: appText(
                                            item.statistics!.passingYards ==
                                                    null
                                                ? "0"
                                                : item.statistics!.passingYards
                                                    .toString(),
                                            fontweight: FontWeight.w400,
                                            fontSize: 14)),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          : Center(
              child: Text(
                "No favourite item added yet!",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            );
    } catch (e) {
      return Center(
        child: Text(
          "No favourite item added yet!!!",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    }
  }
}
