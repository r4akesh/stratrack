import 'package:get/get.dart';
import 'package:stattrack/model/matchdetail_model.dart';
import 'package:stattrack/model/matchstats_model.dart';

import '../model/matchhilight_model.dart';
import '../network/apiClient.dart';

class MatchDetailController extends GetxController {
  var isLoading = false.obs;
  var isLoadingTwo = true.obs;
  final apiClient = Apiclient.instance;
  var staticList = <Groups>[].obs;
  var homePlayerList = <Players>[].obs;
  var awayPlayerList = <Players>[].obs;
  var isHome = true.obs;
  var isStats = true.obs;

  var hightLightList = <Highlights>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  updateView(bool value) {
    isHome = value.obs;
    update();
  }

  updateViewStatsOrPlayer(bool value) {
    isStats = value.obs;
    update();
  }

  clearData() {
    homePlayerList.clear();
    awayPlayerList.clear();
  }

  getLineupsCall(int matchIdd) async {
    Map<String, dynamic> map = {};
    try {
      print("LineupsCall>$matchIdd");
      isLoading.value = true;
      update();
      var data = await apiClient?.getSports(
          url:
              "https://allsportsapi2.p.rapidapi.com/api/american-football/match/$matchIdd/lineups",
          body: map,
          context: Get.context!);
      if (data != null) {
        var response = MatchDetailModel.fromJson(data);
        if (response.home != null) {
          //  homePlayerList.value = response.home?.players as List<Players>;
          // awayPlayerList.value = response.away?.players as List<Players>;
          var homePlayerListLocl = <Players>[];
          var awayPlayerListLocl = <Players>[];
          homePlayerListLocl = response.home?.players as List<Players>;
          awayPlayerListLocl = response.away?.players as List<Players>;
          for (int i = 0; i < homePlayerListLocl.length; i++) {
            if (homePlayerListLocl[i].position == "WR" ||
                homePlayerListLocl[i].position == "RB" ||
                homePlayerListLocl[i].position == "TE" ||
                homePlayerListLocl[i].position == "RB") {
              homePlayerList.add(homePlayerListLocl[i]);
            }
          }
          for (int i = 0; i < awayPlayerListLocl.length; i++) {
            if (awayPlayerListLocl[i].position == "WR" ||
                awayPlayerListLocl[i].position == "RB" ||
                awayPlayerListLocl[i].position == "TE" ||
                awayPlayerListLocl[i].position == "RB") {
              awayPlayerList.add(awayPlayerListLocl[i]);
            }
          }
          print("catch4  >>$isLoading");
          print(homePlayerListLocl.length);
          print(homePlayerList.length);
          isLoading.value = false;

          update();
        }
      }
    } catch (e) {
      print("catch LineupsCall>>$e");
      homePlayerList.value.clear();
      awayPlayerList.value.clear();
      update();
      rethrow;
    } finally {
      // closeProgress();
      isLoading.value = false;
    }
  }

  getStatisticsCall(int matchIdd) async {
    Map<String, dynamic> map = {};
    try {
      print("statisticsLength1>${matchIdd}");
      isLoading.value = true;
      var data = await apiClient?.getSports(
          url:
              "https://allsportsapi2.p.rapidapi.com/api/american-football/match/$matchIdd/statistics",
          body: map,
          context: Get.context!);
      if (data != null) {
        var response = MatchStatsModel.fromJson(data);
        if (response.statistics != null) {
          staticList.value = response.statistics?[0].groups
              as List<Groups>; //getting group at 0th pos
          print("statisticsLength2>${staticList.value.length}");
          isLoading.value = true;
          update();
        }
      }
    } catch (e) {
      print("catch statistics>>$e");
      staticList.value.clear();
      update();
      rethrow;
    } finally {
      // closeProgress();
      isLoading.value = false;
    }
  }

  matchHiglightCall(int matchIdd) {
    //delay for 1 sec coz per sec Api call sow error limit excced
    Future.delayed(Duration(milliseconds: 2000), () {
      matchNameApiCall(matchIdd);
    });
  }

  @override
  void onClose() {
    // hightLightList.value.clear();
    // homePlayerList.value.clear();
    // awayPlayerList.value.clear();
    // staticList.value.clear();
    // isStats = false.obs;
    // isHome = false.obs;
    super.onClose();
  }

  void matchNameApiCall(int matchIdd) async {
    Map<String, dynamic> map = {};
    try {
      print("matchHiglightCall>>$matchIdd");
      isLoadingTwo.value = true;
      // update();
      //showProgressBar();
      var data = await apiClient?.getSports(
          url:
              "https://allsportsapi2.p.rapidapi.com/api/american-football/match/$matchIdd/highlights",
          // url: "https://allsportsapi2.p.rapidapi.com/api/american-football/match/1/highlights",
          body: map,
          context: Get.context!);

      var response = MatchHilightModel.fromJson(data);

      if (response.highlights != null) {
        hightLightList.value = response.highlights as List<Highlights>;
        print("catch11  >>$isLoadingTwo");
        isLoadingTwo.value = false;
        update();
        print("catch22  >>$isLoadingTwo");
      }
    } catch (e) {
      print("catch hightLightList>>$e");
      hightLightList.value.clear();
      isLoadingTwo.value = false;
      rethrow;
    }
  }
}
