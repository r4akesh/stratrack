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
                  itemCount: 5,
                  maxOpened: 2,
                  reverse: false,
                  itemBuilder: (context, index, controller) {
                    return ExpandedTile(
                      theme: const ExpandedTileThemeData(
                        headerColor: Colors.green,
                        headerRadius: 24.0,
                        headerPadding: EdgeInsets.all(24.0),
                        headerSplashColor: Colors.red,
                        //
                        contentBackgroundColor: Colors.blue,
                        contentPadding: EdgeInsets.all(24.0),
                        contentRadius: 12.0,
                      ),
                      controller: index == 2
                          ? controller.copyWith(isExpanded: true)
                          : controller,
                      title: Text(controllerAllTeam.standingList[index].name
                          .toString()),
                      content: Container(
                        color: Colors.red,
                        child: ListView.builder(
                            itemCount: controllerAllTeam
                                .standingList[index].rows?.length,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: ((context, index) {
                              return Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
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
                                          child: Image.asset(
                                            demoImage,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        appText("Philadelphia Eagles",
                                            fontweight: FontWeight.w400)
                                      ],
                                    ),
                                  ));
                            })),
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

    // controllerAllTeam.isLoading.value
    //     ? LoadingWidget()
    //     : ListView.builder(
    //         itemCount: controllerAllTeam.standingList.length,
    //         itemBuilder: ((context, index) {
    //           return GestureDetector(
    //             onTap: () {
    //               Get.to(TeamDetails());
    //             },
    //             child: CustomScrollView(
    //               slivers: <Widget>[
    //                 SliverList(
    //                     delegate:
    //                         SliverChildBuilderDelegate((context, index) {
    //                   return Card(
    //                       shape: RoundedRectangleBorder(
    //                           borderRadius: BorderRadius.circular(50)),
    //                       color: Colors.white,
    //                       margin: EdgeInsets.only(
    //                           top: 15, left: 10, right: 10),
    //                       child: Container(
    //                         height: 100,
    //                         child: Row(
    //                           children: [
    //                             ClipRRect(
    //                               borderRadius: BorderRadius.only(
    //                                   topLeft: Radius.circular(55),
    //                                   bottomLeft: Radius.circular(
    //                                       55)), // Image border
    //                               child: Image.asset(
    //                                 demoImage,
    //                                 fit: BoxFit.cover,
    //                               ),
    //                             ),
    //                             SizedBox(
    //                               width: 20,
    //                             ),
    //                             appText("Philadelphia Eagles",
    //                                 fontweight: FontWeight.w400)
    //                           ],
    //                         ),
    //                       ));
    //                 }, childCount: 10))
    //               ],
    //             ),
    //           );
    //         }));
  }

  _playerCard() {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        color: Colors.white,
        margin: EdgeInsets.only(top: 15, left: 10, right: 10),
        child: Container(
          height: 100,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(55),
                    bottomLeft: Radius.circular(55)), // Image border
                child: Image.asset(
                  demoImage,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              appText("Philadelphia Eagles", fontweight: FontWeight.w400)
            ],
          ),
        ));
  }
}
