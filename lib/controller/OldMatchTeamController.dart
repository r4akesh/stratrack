import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:stattrack/model/upcoming_model.dart';
import 'package:stattrack/utils/constant.dart';

import '../model/SubcriptionModel.dart';
import '../network/apiClient.dart';
import '../utils/commen.dart';

class OldMatchTeamController extends GetxController {
  var isLoading = false.obs;
  final apiClient = Apiclient.instance;

  //var eventListorignal = <Events>[].obs;
  var eventList = <Events>[].obs;
  // var isSelected = 0.obs;
  var weekValue = 0;
//  var dateValue = "";
  var matchId; // used in match detail
  var teamId;
  OldMatchTeamController(String this.teamId);

  @override
  void onInit() {
    super.onInit();
    getData(teamId);
  }

  increseWeek() {
    //if(eventList.isEmpty) return;
    print("weekValue>>${weekValue}");
    if (weekValue > 0) {
      weekValue -= 1;
      getData(fetchPreDate(weekValue));
    }
  }

  decreseWeek() {
    print("weekValue>>${weekValue}");
    if (weekValue >= 0) {
      weekValue += 1;
      getData(fetchPreDate(weekValue));
    }
  }

  void getData(String nextDate) {
    // dateValue = nextDate;
    callUpcomingMatch(nextDate);
  }

  callUpcomingMatch(String teamIDLocal) async {
    Map<String, dynamic> map = {};
    try {
      print("OldTeamMatch");
      isLoading.value = true;
      //showProgressBar();
      var data = await apiClient?.getSports(
          url:
              "https://allsportsapi2.p.rapidapi.com/api/american-football/team/$teamIDLocal/matches/previous/1",
          body: map,
          context: Get.context!);
      var response = UpcomingModel.fromJson(data);

      if (response.events != null) {
        eventList.value = response.events as List<Events>;
        // eventListorignal.value = response.events as List<Events>;
        // int crntTime = DateTime.now().millisecondsSinceEpoch;
        // eventList.clear();
        // for (int i = 0; i < eventListorignal.length; i++) {
        //   var matchTimeMills = eventListorignal[i].startTimestamp! * 1000;
        //   var matchDate = fetchMillsToDate(matchTimeMills);
        //   //if(matchTimeMills <crntTime && date==matchDate){
        //   if (eventListorignal[i].status?.type == "finished" &&
        //       date == matchDate) {
        //     print("catch>>$date >> $matchDate");
        //     eventList.add(eventListorignal[i]);
        //   }
        // }
        update();
      }
    } catch (e) {
      print("catch>>$e");

      eventList.value.clear();
      print("catch>>${eventList.length}");
      rethrow;
    } finally {
      // closeProgress();
      isLoading.value = false;
    }
  }
}
