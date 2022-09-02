import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controller/UpcomingMatchController.dart';
import '../utils/LoadingWidget.dart';
import '../utils/colors.dart';
import '../utils/commen.dart';
import '../utils/constant.dart';
import '../utils/progress_dialog.dart';
import 'match_details.dart';

class UpcomingMatch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      GetX<UpcomingMatchController>(
          init: UpcomingMatchController(),
          builder: (controller) {
            return Column(children: [
              Container(
                margin: EdgeInsets.only(top: 5),
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(

                      child: GestureDetector(
                        onTap: (){
                          controller.decreseWeek();
                        },
                        child: Image.asset(
                          arrowLeftIcon,
                          height: 20,
                          width: 20,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(

                        alignment: Alignment.center,
                        height: 40,
                        width: 50,
                        // child: ListView.builder(scrollDirection: Axis.horizontal ,itemCount: 10,itemBuilder: ((context, index) {
                        child: Text("Week "+controller.weekValue.toString(),style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                          onTap: (){
                            controller.increseWeek();
                            print("nextClick1");
                          },
                          child:Image.asset(
                            arrowRightIcon,
                            height: 20,
                            width: 20,
                          )) ,)
                  ],
                ),
              ),
              Expanded(child: controller.isLoading.value ? LoadingWidget(): controller.weekList.isEmpty? Center(child: Text("No data found",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),): ListView.builder(
                  itemCount: controller.weekList.length,
                  itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(MatchDetails(from: "Upcoming"));
                  },
                  child: Card(
                    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Column(
                      children: [
                        Container(
                          height: 40,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          color: applightgrey,
                          child: Row(
                            children: [
                             // appText("Saturday, August 10, 2019", fontweight: FontWeight.w400, txtColor: appBlack),
                             appText(DateFormat("EEE, MMMM, dd, yyyy").format(DateTime.parse(controller.weekList.value[index].scheduled!)), fontweight: FontWeight.w400, txtColor: appBlack),
                              Spacer(),
                              appText(DateFormat("jm").format(DateTime.parse(controller.weekList.value[index].scheduled!)),
                                  fontweight: FontWeight.w400,
                                  txtColor: appBlack),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 15, bottom: 10, left: 10, right: 10),
                          child: Row(
                            children: [
                              appText(controller.weekList.value[index].home!.name.toString(),
                                  fontweight: FontWeight.w400, fontSize: 14),
                              const SizedBox(
                                width: 10,
                              ),
                              appText("VS",
                                  fontweight: FontWeight.w600, fontSize: 14),
                              const SizedBox(
                                width: 10,
                              ),
                              appText(controller.weekList.value[index].away!.name.toString(),
                                  fontweight: FontWeight.w400, fontSize: 14),
                            ],
                          ),
                        ),
                        Container(
                            alignment: Alignment.bottomRight,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: appText(controller.weekList.value[index].venue!.name!,
                                fontweight: FontWeight.w400,
                                fontSize: 14,
                                txtColor: appLightBlue))
                      ],
                    ),
                  ),
                );
              }))
              ,
            ],);
          }
        );

  }
}
