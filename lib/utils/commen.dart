import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:stattrack/controller/loginController.dart';

import 'colors.dart';

Container appButton(
    BuildContext context, String txt, double height, Color buttonbg) {
  return Container(
    width: MediaQuery.of(context).size.width,
    margin: const EdgeInsets.symmetric(horizontal: 20),
    height: height,
    decoration: BoxDecoration(
      color: buttonbg,
      borderRadius: const BorderRadius.all(Radius.circular(100)),
    ),
    child: Center(
        child: Text(
      txt,
      style: const TextStyle(
          fontWeight: FontWeight.w600, color: Colors.white, fontSize: 18),
    )),
  );
}

Text appText(String txt,
        {FontWeight fontweight = FontWeight.w600,
        double fontSize = 16,
        Color txtColor = appBlack,
        bool isUnderline = false,
        TextAlign textAlign = TextAlign.start}) =>
    Text(
      txt,
      textAlign: textAlign,
      style: TextStyle(
          fontSize: fontSize,
          color: txtColor,
          fontWeight: fontweight,
          fontFamily: 'Rubik',
          decoration:
              isUnderline ? TextDecoration.underline : TextDecoration.none),
    );

Widget appTextField(String lable,
    {TextEditingController? controller, String hint = ""}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      appText(lable),
      TextField(
        controller: controller,
        cursorColor: appBlack,
        maxLines: 1,
        style: const TextStyle(color: Colors.grey, fontSize: 16),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(fontSize: 14),
          labelStyle:
              const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          border: const UnderlineInputBorder(
            borderSide: BorderSide(color: appLightBlue),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: appLightBlue),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: appLightBlue),
          ),
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: appLightBlue),
          ),
          disabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: appLightBlue),
          ),
        ),
      ),
    ],
  );
}

Widget appTextFieldPassword(
  String lable,
  bool obsecure, {
  TextEditingController? controller,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      appText(lable),
      TextField(
        controller: controller,
        cursorColor: appBlack,
        maxLines: 1,
        obscureText: obsecure,
        style: const TextStyle(color: Colors.grey, fontSize: 16),
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: () {},
          ),
          labelStyle:
              const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          border: const UnderlineInputBorder(
            borderSide: BorderSide(color: appLightBlue),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: appLightBlue),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: appLightBlue),
          ),
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: appLightBlue),
          ),
          disabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: appLightBlue),
          ),
        ),
      ),
    ],
  );
}

TextField appTextFieldEdit({TextEditingController? controller}) {

  return TextField(
    textAlign: TextAlign.end,
    cursorColor: appBlack,
    controller:controller,
    maxLines: 1,
    style: const TextStyle(color: Colors.black, fontSize: 16),
    decoration: const InputDecoration(
        labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none),
  );
}

void toast(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 14.0);
}

bool isEmail(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

void showMyAlert(BuildContext context, String msg) {
  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text("StatTrack"),
      content: Text(msg),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(ctx).pop();
          },
          child: Container(
            padding: const EdgeInsets.all(5),
            child: const Text("OK"),
          ),
        ),
      ],
    ),
  );
}

 String fetchNextDate(int weekValue){
   var now =   DateTime.now();
   final tomorrow = DateTime(now.year, now.month, now.day + weekValue);
 //  final yesterday = DateTime(now.year, now.month, now.day - 1);
   var formatter =   DateFormat('dd/MM/yyyy');
 //  String formattedDate = formatter.format(now);//current
   String formattedDate = formatter.format(tomorrow);//nextDate
  // String formattedDate = formatter.format(yesterday);//previousDate
  // print("formattedDate>>${formattedDate}"); // 2016-01-25
  // print("formattedDate>>${formattedDate}");

  return formattedDate;
 }

String fetchPreDate(int weekValue){
  var now =   DateTime.now();
  final yesterday = DateTime(now.year, now.month, now.day - weekValue);
  var formatter =   DateFormat('dd/MM/yyyy');
  String formattedDate = formatter.format(yesterday);//nextDate
  //print("formattedDate>>${formattedDate}");
  return formattedDate;
}

String fetchMillsToDate(int mills){
  final DateTime date1 = DateTime.fromMillisecondsSinceEpoch(mills);
  var formatter =   DateFormat('dd/MM/yyyy');
  String formattedDate = formatter.format(date1);//nextDate
  print("formattedDate>>${formattedDate}");
  return formattedDate;
}

showProgressBar() {
  //for whole screen
  Get.dialog(
    const SpinKitRing(
      color: Colors.white,
      duration: Duration(milliseconds: 1000),
      size: 40,
      lineWidth: 3,
    ),
    barrierDismissible: true,
  );
}
closeProgress() {
  Get.back();
}
