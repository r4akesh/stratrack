

import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/commen.dart';
import '../utils/constant.dart';

class Notifaction extends StatelessWidget {
  const Notifaction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: notificationView() ,
    );
  }
  AppBar appBar() {
    return AppBar(
      toolbarHeight: 100,
      title: appText(
        "Notifaction",
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

  Widget notificationView() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          appText("Clear All",txtColor: Colors.grey),
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  appText("Update Avalible",
                      fontweight: FontWeight.w400, fontSize: 14),
                  const SizedBox(
                    height: 5,
                  ),
                  appText(
                      "Amet minim mollit non deserunt ullamco est sit to aliqua dolor do amet sint.",
                      fontweight: FontWeight.w300,
                      fontSize: 14),
                  const SizedBox(
                    height: 5,
                  ),
                  appText("10 Jay, 2022 | 9.00 pm",
                      fontweight: FontWeight.w300,
                      fontSize: 12,
                      txtColor: appTextGrey),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    thickness: 1,
                    color: appTextGrey,
                  )
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
