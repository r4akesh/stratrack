import 'package:get/get.dart';
import 'package:stattrack/model/allteam_model.dart';

import 'package:stattrack/network/apiClient.dart';

class AllteamController extends GetxController {
  var isLoading = false.obs;
  final apiClient = Apiclient.instance;
  var standingList = <Standings>[].obs;

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
              "https://allsportsapi2.p.rapidapi.com/api/american-football/tournament/9464/season/46786/standings/total",
          body: map,
          context: Get.context!);
      var response = AllTeamModel.fromJson(data);

      if (response.standings != null) {
        standingList.value = response.standings as List<Standings>;
        // update();
        print("getAllTeamApiCall>>${standingList.length}");
      }
    } catch (e) {
      print("catch>>$e");

      standingList.value.clear();
      print("catch>>${standingList.length}");
      rethrow;
    } finally {
      // closeProgress();
      isLoading.value = false;
    }
  }
}
