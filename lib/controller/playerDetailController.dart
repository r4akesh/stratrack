import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:stattrack/main.dart';
import 'package:stattrack/model/login_model.dart';
import 'package:stattrack/network/apiClient.dart';
import 'package:stattrack/ui/subscription.dart';
import 'package:stattrack/utils/commen.dart';

import '../model/player_model.dart';
import '../ui/dashBoard.dart';
import '../utils/constant.dart';

class PlayerDetailController extends GetxController {
 // var isEmailValid = false.obs;
  //TextEditingController? emailEditController;

  var isLoading = false.obs;
  final apiClient = Apiclient.instance;
  var playerDetail = Player().obs;
  @override
  void onInit() {
    super.onInit();

  }


  plrDetailAPICall(int plrId) async {
    Map<String, dynamic> map = {};
    try {
      print("plrDetailAPICall");
      isLoading.value = true;
      //showProgressBar();
      var data = await apiClient?.getSports(
          url: "https://allsportsapi2.p.rapidapi.com/api/american-football/player/$plrId",
          body: map,
          context: Get.context!);
      var response = PlayerDetailModel.fromJson(data);

      if (response.player != null) {
        playerDetail.value = response.player as Player;
        isLoading.value = false;
        update();
        print("try plrDetailAPICal ${isLoading.value}");
      }
    }
    catch(e){
      print("catch plrDetailAPICall >>$e");
      rethrow;
    }finally {
      // closeProgress();
      isLoading.value = false;
    }
  }


}
