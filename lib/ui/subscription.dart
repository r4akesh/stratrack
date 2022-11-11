import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
//import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:stattrack/ui/dashBoard.dart';
import 'package:stattrack/ui/login.dart';
import 'package:stattrack/utils/colors.dart';
import 'package:stattrack/utils/commen.dart';
import 'package:stattrack/utils/constant.dart';

import '../controller/SubscriptionPlanListController.dart';
import '../main.dart';
import '../model/SubcriptionModel.dart';

class Subscription extends StatelessWidget {
  const Subscription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var selectedplans = Subscriptionplans();
    SubscriptionListController subscriptionListController =
        Get.put(SubscriptionListController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
            GestureDetector(
              onTap: () {
                print("click");
                Get.off(Login());
                // Navigator.pop(context);
                //SystemNavigator.pop(); // kill app
              },
              child: Container(
                margin: const EdgeInsets.only(top: 50, left: 15),
                child: Image.asset(
                  backIcon,
                  scale: 3,
                  color: Colors.white,
                ),
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
                Text(
                  "Subscribe StatTrack",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                )
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
          Expanded(
            child: GetBuilder<SubscriptionListController>(
              init: SubscriptionListController(),
              builder: (subscriptionListController) => ListView.builder(
                itemCount:
                    subscriptionListController.subscriptionplans.value.length,
                itemBuilder: (context, index) {
                  selectedplans = subscriptionListController
                      .subscriptionplans[index]; //intially 0th index set value
                  return ListTile(
                    onTap: () {
                      subscriptionListController.isSelected.value = index;
                      subscriptionListController.update();
                      selectedplans =
                          subscriptionListController.subscriptionplans[index];
                    },
                    leading:
                        subscriptionListController.isSelected.value == index
                            ? Icon(Icons.radio_button_checked, size: 25)
                            : Icon(Icons.radio_button_unchecked, size: 25),
                    horizontalTitleGap: 5,
                    minLeadingWidth: 5,
                    minVerticalPadding: 10,
                    title: appText(
                        subscriptionListController
                                .subscriptionplans.value[index].planName ??
                            "No Data Found",
                        fontSize: 14),
                    subtitle: appText(
                        subscriptionListController.subscriptionplans
                                .value[index].planDescription ??
                            "No Data Found",
                        txtColor: Colors.grey,
                        fontweight: FontWeight.w300,
                        fontSize: 14),
                    trailing: appText(
                        "\$" +
                                subscriptionListController
                                    .subscriptionplans.value[index].planPrice
                                    .toString() ??
                            "N/A",
                        fontSize: 12),
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          GestureDetector(
              onTap: () async {
                //  Get.off(Dashboard());
                showMyBottomSheet(
                    context, subscriptionListController, selectedplans);
              },
              child: appButton(context, "Active now", 60, appOrange)),
          SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }

  void showMyBottomSheet(
      BuildContext myContext,
      SubscriptionListController subscriptionController,
      Subscriptionplans selectedplansLcl) {
    var selectedCardNum = "";
    var selectedCVC = "";
    var selectedMonth = "";
    var selectedYear = "";
    showModalBottomSheet<void>(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10.0))),
        isScrollControlled: true,
        context: myContext,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                appText("Card Information"),
                SizedBox(
                  height: 10,
                ),
                CardField(
                  dangerouslyGetFullCardDetails: true,
                  dangerouslyUpdateFullCardDetails: true,
                  onCardChanged: (card) {
                    print("card>>{$card}");
                    selectedCVC = card?.cvc.toString() ?? "";
                    selectedMonth = card?.expiryMonth.toString() ?? "";
                    selectedYear = card?.expiryYear.toString() ?? "";
                    selectedCardNum = card?.number.toString() ?? "";
                    // print("card{$ccc>>>$exp>>$crd>>$year}") ?? "";
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    print("hi${selectedplansLcl.planPrice}");
                    subscriptionController.doPayment(
                        selectedplansLcl,
                        selectedCardNum,
                        selectedCVC,
                        selectedMonth,
                        selectedYear);
                  },
                  child: Container(
                    width: 200,
                    height: 50,
                    child: Obx(() => subscriptionController.isLoading.value
                        ? Container(
                            height: 5,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : appButton(
                            context,
                            "Pay \$${selectedplansLcl.planPrice.toString().trim()}",
                            60,
                            appOrange)),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          );
        });
  }
}
