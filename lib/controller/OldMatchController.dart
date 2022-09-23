import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:stattrack/model/upcoming_model.dart';
import 'package:stattrack/utils/constant.dart';

import '../model/SubcriptionModel.dart';
import '../network/apiClient.dart';
import '../utils/commen.dart';

class OldMatchController extends GetxController {
  var isLoading = false.obs;
  final apiClient = Apiclient.instance;

  var eventListorignal = <Events>[].obs;
  var eventList = <Events>[].obs;
 // var isSelected = 0.obs;
  var weekValue = 0;
  var dateValue = "";

  @override
  void onInit() {
    super.onInit();
    getData(fetchPreDate(weekValue));
  }

  increseWeek() {
    //if(eventList.isEmpty) return;
    print("weekValue>>${weekValue}");
    if(weekValue>0) {
      weekValue -= 1;
      getData(fetchPreDate(weekValue));
    }
  }

  decreseWeek() {
    print("weekValue>>${weekValue}");
    if (weekValue >=0) {
      weekValue += 1;
      getData(fetchPreDate(weekValue));
    }
  }



  void getData(String nextDate) {
    dateValue = nextDate;
    callUpcomingMatch(nextDate);
  }

  callUpcomingMatch(String date) async {
    Map<String, dynamic> map = {};
    try {
      print("callUpcomingMatch");
      isLoading.value = true;
      //showProgressBar();
      var data = await apiClient?.getSports(
          url: "https://allsportsapi2.p.rapidapi.com/api/american-football/matches/$date",
          body: map,
          context: Get.context!);
      var response = UpcomingModel.fromJson(data);

      if (response.events != null) {
        eventListorignal.value = response.events as List<Events>;
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



      }
    }
    catch(e){
      print("catch>>$e");

      eventListorignal.value.clear();
      rethrow;
    }finally {
      // closeProgress();
      isLoading.value = false;
    }
  }
}
