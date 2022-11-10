import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stattrack/controller/hometab_controller.dart';
import 'package:stattrack/main.dart';
import 'package:stattrack/ui/selectMatch.dart';

import '../utils/LoadingWidget.dart';
import '../utils/colors.dart';
import '../utils/commen.dart';
import '../utils/constant.dart';

class HomeTabScreen extends StatelessWidget {
  const HomeTabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<HomeTabController>(
        init: HomeTabController(),
        builder: (homeController) {  

          return homeController.isLoading.value
              ? LoadingWidget()
              : ListView.builder(
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
        });
  }

  bool isPlanActive() {
    if (MyApp.box.read(IS_SUBSCRIBE))
      return true;
    else
      return false;
  }
}
