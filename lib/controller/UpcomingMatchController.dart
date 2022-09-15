import 'package:get/get.dart';
import 'package:stattrack/model/upcoming_model.dart';
import 'package:stattrack/utils/constant.dart';

import '../model/SubcriptionModel.dart';
import '../network/apiClient.dart';
import '../utils/commen.dart';

class UpcomingMatchController extends GetxController {
  var isLoading = false.obs;
  final apiClient = Apiclient.instance;

//  var subscriptionplans = <Subscriptionplans>[].obs;
  var eventList = <Events>[].obs;
  var isSelected = 0.obs;
  var weekValue = 1.obs;

  @override
  void onInit() {
    super.onInit();
   // getData(weekValue.value);
    getData();
  }

  // increseWeek() {
  //   if(eventList.isEmpty) return;
  //
  //   getData( );
  // }
  //
  // decreseWeek() {
  //   if (weekValue.value > 1) {
  //     weekValue -= 1;
  //     getData(weekValue.value);
  //   }
  // }



  void getData() {
    callUpcomingMatch();
  }

  callUpcomingMatch() async {
    Map<String, dynamic> map = {};
    try {
      print("callUpcomingMatch");
      isLoading.value = true;
      //showProgressBar();
      var data = await apiClient?.getSports(
          url: "https://allsportsapi2.p.rapidapi.com/api/american-football/matches/15/9/2022",
          body: map,
          context: Get.context!);
      var response = UpcomingModel.fromJson(data);

      if (response.events != null) {
        eventList.value = response.events as List<Events>;
        update();
      }
    }
    catch(e){
      print("catch");

      eventList.value.clear();
    }finally {
      // closeProgress();
      isLoading.value = false;
    }
  }
}
