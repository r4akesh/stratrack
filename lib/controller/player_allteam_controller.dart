import 'package:get/get.dart';
import 'package:stattrack/model/TeamPlayerModel.dart';
import 'package:stattrack/model/allteam_model.dart';

import 'package:stattrack/network/apiClient.dart';
import 'package:stattrack/utils/constant.dart';

class PlayerAllTeamController extends GetxController {
  var isLoading = false.obs;
  final apiClient = Apiclient.instance;
  var teamPlryModel = TeamPlayerModel().obs;
  var forieginPlayerList = <ForeignPlayers>[].obs;
  var nationalPlayerList = <NationalPlayers>[].obs;
  var playerPlayerList = <Players>[].obs;
  var teamId = "";
  PlayerAllTeamController(String this.teamId);
  @override
  void onInit() {
    super.onInit();
    getPlayerTeamApiCall(teamId);
  }

  void getPlayerTeamApiCall(String teamIDD) async {
    Map<String, dynamic> map = {};
    try {
      print("getPlayerTeamApiCall");
      isLoading.value = true;
      //showProgressBar();
      var data = await apiClient?.getSports(
          url:
              "https://allsportsapi2.p.rapidapi.com/api/american-football/team/$teamIDD/players",
          body: map,
          context: Get.context!);
      var response = TeamPlayerModel.fromJson(data);

      if (response != null) {
        forieginPlayerList.value =
            response.foreignPlayers as List<ForeignPlayers>;
        nationalPlayerList.value =
            response.nationalPlayers as List<NationalPlayers>;
        playerPlayerList.value = response.players as List<Players>;
        // update();
        print("forieginPlayerList.lenght>>${forieginPlayerList.length}");
      }
    } catch (e) {
      print("catch>>$e");

      forieginPlayerList.value.clear();
      nationalPlayerList.value.clear();
      playerPlayerList.value.clear();

      rethrow;
    } finally {
      // closeProgress();
      isLoading.value = false;
    }
  }
}
