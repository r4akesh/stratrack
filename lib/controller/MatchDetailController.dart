import 'package:get/get.dart';
import 'package:stattrack/model/matchdetail_model.dart';

import '../network/apiClient.dart';

class MatchDetailController extends GetxController {
  var isLoading = false.obs;
  final apiClient = Apiclient.instance;
  var homePlayerList = <Players>[].obs;
  var awayPlayerList = <Players>[].obs;

  var isHome = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  updateView(bool value ){
    isHome  = value.obs;
    update();
  }

  getLineupsCall(int matchIdd) async {
    Map<String, dynamic> map = {};
    try {
      print("LineupsCall1$matchIdd");
      isLoading.value = true;
      //showProgressBar();
      var data = await apiClient?.getSports(
          url: "https://allsportsapi2.p.rapidapi.com/api/american-football/match/$matchIdd/lineups",
          body: map,
          context: Get.context!);
      var response = MatchDetailModel.fromJson(data);

      if (response.home != null) {
        homePlayerList.value = response.home?.players as List<Players>;
        awayPlayerList.value = response.away?.players as List<Players>;
        print("LineupsCall length${homePlayerList.length}");
        print("LineupsCall name${homePlayerList[0].player?.name}");
        isLoading.value = true;
        update();


      }
    } catch (e) {
      print("catch LineupsCall>>$e");
      homePlayerList.value.clear();
      awayPlayerList.value.clear();
      rethrow;
    } finally {
      // closeProgress();
      isLoading.value = false;
    }
  }
}
