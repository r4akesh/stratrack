import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stattrack/ui/team_details.dart';

import '../controller/allteam_controller.dart';
import '../utils/LoadingWidget.dart';
import '../utils/commen.dart';
import '../utils/constant.dart';

class Allteam extends StatelessWidget {
  const Allteam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<AllteamController>(
        init: AllteamController(),
        builder: (controllerAllTeam) {
          return controllerAllTeam.isLoading.value
              ? LoadingWidget()
              : ExpandedTileList.builder(
                  padding:
                      EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
                  itemCount: controllerAllTeam.standingList.length,
                  maxOpened: 2,
                  reverse: false,
                  itemBuilder: (context, indexMain, controller) {
                    print(
                        "length${controllerAllTeam.standingList[indexMain].rows?.length}");
                    return ExpandedTile(
                      theme: const ExpandedTileThemeData(
                        headerColor: Colors.blue,
                        headerRadius: 24.0,

                        headerPadding: EdgeInsets.all(15.0),
                        headerSplashColor: Colors.red,
                        //
                        contentBackgroundColor: Colors.white,
                        contentPadding: EdgeInsets.all(0.0),
                        contentRadius: 20.0,
                      ),
                      controller: indexMain == 1
                          ? controller.copyWith(isExpanded: true)
                          : controller,
                      title: Text(controllerAllTeam.standingList[indexMain].name
                          .toString()),
                      content: Container(
                        child: controllerAllTeam
                                    .standingList[indexMain].rows!.length! >
                                0
                            ? ListView.builder(
                                itemCount: controllerAllTeam
                                    .standingList[indexMain].rows?.length,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: ((context, posList) {
                                  var teamId = controllerAllTeam
                                      .standingList[indexMain]
                                      .rows?[posList]
                                      .id;
                                  return Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      color: Colors.white,
                                      margin: EdgeInsets.only(
                                          top: 15, left: 10, right: 10),
                                      child: Container(
                                        height: 100,
                                        child: Row(
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(55),
                                                  bottomLeft: Radius.circular(
                                                      55)), // Image border
                                              child: FadeInImage(
                                                  height: 100,
                                                  image: NetworkImage(
                                                      "https://allsportsapi2.p.rapidapi.com/api/american-football/team/$teamId/image",
                                                      headers: const {
                                                        "X-RapidAPI-Key":
                                                            RAPID_API_KEY,
                                                        "X-RapidAPI-Host":
                                                            "allsportsapi2.p.rapidapi.com"
                                                      }),
                                                  placeholder:
                                                      AssetImage(appLogo)),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            appText(
                                                controllerAllTeam
                                                        .standingList[indexMain]
                                                        .rows?[posList]
                                                        .team
                                                        ?.name ??
                                                    "",
                                                fontweight: FontWeight.w400)
                                          ],
                                        ),
                                      ));
                                }))
                            : LoadingWidget(),
                      ),
                      onTap: () {
                        debugPrint("tapped!!");
                      },
                      onLongTap: () {
                        debugPrint("looooooooooong tapped!!");
                      },
                    );
                  },
                );
        });
  }
}
