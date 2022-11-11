import 'package:get/get.dart';
import 'package:stattrack/model/allteam_model.dart';
import 'package:stattrack/model/is_subscribe_model.dart';

import 'package:stattrack/network/apiClient.dart';
import 'package:stattrack/utils/constant.dart';

import '../main.dart';
import '../model/commonmodel.dart';

class HomeTabController extends GetxController {
  var isLoading = false.obs;
  final apiClient = Apiclient.instance;

  @override
  void onInit() {
    super.onInit();
    try {
      if (MyApp.box.read(IS_SUBSCRIBE)) {
      } else {
        getIsSubscribeApiCall();
      }
    } catch (e) {
      getIsSubscribeApiCall();
    }
  }

  void getIsSubscribeApiCall() async {
    Map<String, dynamic> map = {
      "userId": MyApp.box.read("id"),
    };
    try {
      print("isSubscribe");
      isLoading.value = true;
      //showProgressBar();
      var data = await apiClient?.post(
          url: BASE_URL + "users/isSubscribe",
          body: map,
          context: Get.context!);
      var response = IsSubsscribeModel.fromJson(data);

      if (response.code == 200) {
        var isSubscribe = response.data?.isPlanActive;
        if (isSubscribe == IS_ENABLE) {
          MyApp.box.write(IS_SUBSCRIBE, true);
        } else {
          MyApp.box.write(IS_SUBSCRIBE, false);
        }        
        print("isSubscribe>>>${isSubscribe}");
      } else {
        print("${response.message}");
        MyApp.box.write(IS_SUBSCRIBE, false);
      }
    } catch (e) {
      print("catch1>>$e");

      rethrow;
    } finally {
      print("finally isSubscribe");
      // closeProgress();
      isLoading.value = false;
    }
  }
}
