import 'package:get/get.dart';
import 'package:stattrack/model/topplayer_model.dart';

import 'package:stattrack/network/apiClient.dart';

class AllteamStatsController extends GetxController {
  var isLoading = false.obs;
  final apiClient = Apiclient.instance;
  var topPlayerList = TopPlayers().obs;

  @override
  void onInit() {
    super.onInit();
    getAllTeamApiCall();
  }

  void getAllTeamApiCall() async {
    Map<String, dynamic> map = {};
    try {
      print("getAllTeamApiCall");
      isLoading.value = true;
      //showProgressBar();
      var data = await apiClient?.getSports(
          url:
              "https://allsportsapi2.p.rapidapi.com/api/american-football/team/4426/tournament/9464/season/36422/best-players/regularSeason",
          body: map,
          context: Get.context!);
      var response = TopPlayerModel.fromJson(data);

      if (response.topPlayers != null) {
        // topPlayerList.value = response.topPlayers as List<TopPlayers>;
        topPlayerList.value = response.topPlayers as TopPlayers;
        var vv = topPlayerList.value.defensiveInterceptions;
        // update();
         print("vv>>${vv}");
      }
    } catch (e) {
      print("catch>>$e");

      //topPlayerList.value.clear();
      // print("catch>>${topPlayerList.length}");
      rethrow;
    } finally {
      // closeProgress();
      isLoading.value = false;
    }
  }
}
