
import 'package:get/get.dart';
import 'package:stattrack/model/matchdetail_model.dart';

import '../network/apiClient.dart';

class MatchPlayerStatsController extends GetxController{
  var isLoading = false.obs;
  final apiClient = Apiclient.instance;
  var homePlayers = <Players>[].obs;
  var matchIdFetchFromPreScreen;
  var matchIdd;

  @override
  void onInit() {
     super.onInit();
     getLineupsCall(matchIdd);
  }


  getLineupsCall(String matchIdd) async {
    Map<String, dynamic> map = {};
    try {
      print("LineupsCall");
      isLoading.value = true;
      //showProgressBar();
      var data = await apiClient?.getSports(
          url: "https://allsportsapi2.p.rapidapi.com/api/american-football/match/$matchIdd/lineups",
          body: map,
          context: Get.context!);
      var response = MatchDetailModel.fromJson(data);

      if (response.home != null) {
      /*  eventListorignal.value = response.events as List<Events>;
        int crntTime =  DateTime.now().millisecondsSinceEpoch;
        eventList.clear();
        for(int i= 0 ; i<eventListorignal.length;i++){
          var matchTimeMills= eventListorignal[i].startTimestamp!*1000;
          var matchDate =  fetchMillsToDate(matchTimeMills);
          //if(matchTimeMills <crntTime && date==matchDate){
          if(eventListorignal[i].status?.type=="finished" && date==matchDate){
            print("catch>>$date >> $matchDate");
            eventList.add(eventListorignal[i]);
          }
        }
        update();
*/


      }
    }
    catch(e){
      print("catch>>$e");

     // eventListorignal.value.clear();
      rethrow;
    }finally {
      // closeProgress();
      isLoading.value = false;
    }
  }
}