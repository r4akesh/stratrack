import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:stattrack/model/upcoming_model.dart';
import 'package:stattrack/utils/constant.dart';

import '../model/SubcriptionModel.dart';
import '../network/apiClient.dart';
import '../utils/commen.dart';

class LiveMatchController extends GetxController {
  var isLoading = false.obs;
  final apiClient = Apiclient.instance;

   var eventList = <Events>[].obs;
 // var eventListOrignal = <Events>[].obs;
  var isSelected = 0.obs;
  var weekValue = 0;//1
  var dateValue = "";
  var matchId ;
  @override
  void onInit() {
    super.onInit();


    getData(fetchNextDate(weekValue));
  }

  increseWeek() {
    //if(eventList.isEmpty) return;
    weekValue += 1;
    getData(fetchNextDate(weekValue));
  }

  decreseWeek() {
    if (weekValue > 1) {
      weekValue -= 1;
      getData(fetchNextDate(weekValue));
    }
  }



  void getData(String nextDate) {
    dateValue = nextDate;
    callUpcomingMatch(nextDate);
  }

  callUpcomingMatch(String date) async {
    Map<String, dynamic> map = {};
    try {
      print("LiveMatch");
      isLoading.value = true;
      //showProgressBar();
      var data = await apiClient?.getSports(
          url: "https://allsportsapi2.p.rapidapi.com/api/american-football/matches/live",
          body: map,
          context: Get.context!);
      var response = UpcomingModel.fromJson(data);

      if (response.events != null) {
        eventList.value = response.events as List<Events>;
        int crntTime =  DateTime.now().millisecondsSinceEpoch;
       // eventList.clear();
        // for(int i= 0 ; i<eventListOrignal.length;i++){
        //   var matchTimeMills= eventListOrignal[i].startTimestamp!*1000;
        //  var matchDate =  fetchMillsToDate(matchTimeMills);
        // // if(matchTimeMills >crntTime && date==matchDate){
        //   if(eventListOrignal[i].status?.type=="notstarted" && date==matchDate){//
        //   //  print("catch>>$date >> ${eventList[i].status?.type}");
        //     eventList.add(eventListOrignal[i]);
        //    }
        // }
        update();
      }
    }
    catch(e){
      print("catch>>$e");
      //eventListOrignal.value.clear();
      eventList.value.clear();
      rethrow;
    }finally {
      // closeProgress();
      isLoading.value = false;
    }
  }
}
