import 'package:get/get.dart';

import 'package:stattrack/network/apiClient.dart';
import 'package:stattrack/utils/constant.dart';

import '../main.dart';
import '../model/ActivePlanModel.dart';

class ExpiredPlanController extends GetxController {
  var isLoading = false.obs;
  final apiClient = Apiclient.instance;
  //var subscriptionData = ActivePlanModel().obs;
  //var subscriptionData = Rx<SubscriptionPlans> ;
  // var subscriptionDataNew = ActivePlanModel().obs();
  var subscriptionDataNew = <SubscriptionPlans>[].obs;
  @override
  void onInit() {
    super.onInit();
     if(subscriptionDataNew.length==0)
    myPlanApiCall();
  }

  void myPlanApiCall() async {
    Map<String, dynamic> map = {
      "userId": MyApp.box.read("id"),
    };
    try {
      print("mycurrentplanCall");
      isLoading.value = true;
      //showProgressBar();
      var data = await apiClient?.post(
          url: BASE_URL + "users/myplans",
          body: map,
          context: Get.context!);

      var response = ActivePlanModel.fromJson(data);

      if (response.data != null) {
        subscriptionDataNew.value =
            response.data?.subscriptionPlans as List<SubscriptionPlans>;
        for (int i = 0; i < subscriptionDataNew.length; i++) {
          print("mycurrentplanCall>>${subscriptionDataNew[i].planDescription}");
        }
      } else {
        print("else>>");
      }
    } catch (e) {
      print("catch>>$e");

      rethrow;
    } finally {
      // closeProgress();
      isLoading.value = false;
    }
  }
}
