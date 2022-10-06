import 'package:get/get.dart';
import 'package:stattrack/model/matchdetail_model.dart';

import '../model/matchhilight_model.dart';
import '../network/apiClient.dart';

class MatchDetailController extends GetxController {
  var isLoading = false.obs;
  var isLoadingTwo = true.obs;
  final apiClient = Apiclient.instance;
  var homePlayerList = <Players>[].obs;
  var awayPlayerList = <Players>[].obs;
  var isHome = true.obs;

  var hightLightList = <Highlights>[].obs;

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
      print("LineupsCall>$matchIdd");
      isLoading.value = true;
      //showProgressBar();
      var data = await apiClient?.getSports(
          url: "https://allsportsapi2.p.rapidapi.com/api/american-football/match/$matchIdd/lineups",
          body: map,
          context: Get.context!);
     // print("data>>${data}");
      if(data!=null) {
        var response = MatchDetailModel.fromJson(data);
        if (response.home != null) {
          homePlayerList.value = response.home?.players as List<Players>;
          awayPlayerList.value = response.away?.players as List<Players>;
          print("catch3  >>$isLoading");
          isLoading.value = true;
          print("catch4  >>$isLoading");
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



  matchHiglightCall(int matchIdd)  {
    //delay for 1 sec coz per sec Api call sow error limit excced
    Future.delayed(Duration(milliseconds: 1000), () {
     matchNameApiCall(matchIdd);
    });

  }

  @override
  void onClose() {
    hightLightList.value.clear();
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
          url: "https://allsportsapi2.p.rapidapi.com/api/american-football/match/$matchIdd/highlights",
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
