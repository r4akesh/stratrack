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
  var weekList = <Games>[].obs;
  var isSelected = 0.obs;
  var weekValue = 1.obs;

  @override
  void onInit() {
    super.onInit();
    getData(weekValue.value);
  }

  increseWeek() {
    if(weekList.isEmpty) return;
    weekValue += 1;
    getData(weekValue.value);
  }

  decreseWeek() {
    if (weekValue.value > 1) {
      weekValue -= 1;
      getData(weekValue.value);
    }
  }

  callUpcomingMatch(int value) async {
    Map<String, dynamic> map = {};
    try {
      print("callUpcomingMatch");
      isLoading.value = true;
      //showProgressBar();
      var data = await apiClient?.get(
          url: "http://api.sportradar.us/nfl/official/trial/v7/en/games/2022/REG/" + weekValue.value.toString() + "/schedule.json?api_key=2ecuc2rgset82rqvy482wef3",
          body: map,
          context: Get.context!);
      var response = UpcomingModel.fromJson(data);

      if (response.week?.games != null) {
        weekList.value.clear();
        weekList.value = response.week?.games as List<Games>;
        update();
      }
    }
    catch(e){
      print("catch");

      weekList.value.clear();
    }finally {
      // closeProgress();
      isLoading.value = false;
    }
  }

  void getData(int value) {
    callUpcomingMatch(value);
  }
}
