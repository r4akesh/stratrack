import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stattrack/ui/dashBoard.dart';
import 'package:stattrack/utils/colors.dart';
import 'package:stattrack/utils/commen.dart';
import 'package:stattrack/utils/constant.dart';

import '../controller/SubscriptionPlanListController.dart';
import '../main.dart';

class Subscription extends StatelessWidget {
  const Subscription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // SubscriptionListController subscriptionListController = Get.put(SubscriptionListController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          toolbarHeight: 200,
          backgroundColor: Colors.transparent,
          flexibleSpace: Stack(
            children: [
              Image.asset(
                subscription_plan_bg,
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width,
              ),
              Container(
                margin: const EdgeInsets.only(top: 50, left: 15),
                child: Image.asset(
                  backIcon,
                  scale: 3,
                  color: Colors.white,
                ),
              ),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 60),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          StarIcon,
                          scale: 3,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                   Text("Subscribe StatTrack", style: TextStyle(fontSize: 18, color: Colors.white),)
                  //Text("name"+MyApp.box.read("firstName"), style: TextStyle(fontSize: 18, color: Colors.white),)
                ],
              )
            ],
          ),

      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: appText(
                "If you choose StatTrack membership now you will get 50% discount on our most popular subscription.",
                textAlign: TextAlign.center,
                fontSize: 14,
                fontweight: FontWeight.w400),
          ),
          SizedBox(
            height: 300,
            child: GetBuilder<SubscriptionListController>(
              init: SubscriptionListController(),
              builder: (subscriptionListController) => ListView.builder(
                itemCount: subscriptionListController.subscriptionplans.value.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      subscriptionListController.isSelected.value = index;
                      subscriptionListController.update();
                    },
                    leading: subscriptionListController.isSelected.value == index
                        ? Icon(Icons.radio_button_checked, size: 25)
                        : Icon(Icons.radio_button_unchecked, size: 25),
                    horizontalTitleGap: 5,
                    minLeadingWidth: 5,
                    minVerticalPadding: 10,
                    title: appText(subscriptionListController.subscriptionplans.value[index].planName ?? "No Data Found", fontSize: 14),
                    subtitle: appText(subscriptionListController.subscriptionplans.value[index].planDescription ?? "No Data Found",
                        txtColor: Colors.grey,
                        fontweight: FontWeight.w300,
                        fontSize: 14),
                  );
                },
              ),
            ),
          ),
          GestureDetector(
              onTap: () {
                Get.off(Dashboard());

              },
              child: appButton(context, "Active now", 60, appOrange)),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}