import 'package:get/get.dart';
import 'package:stattrack/main.dart';
import 'package:stattrack/utils/commen.dart';

import '../model/deluser_model.dart';
import '../network/apiClient.dart';
import '../ui/welcome.dart';
import '../utils/constant.dart';

class DashboardController extends GetxController {
  var initialItemSelected = 0.obs;
  var isNotificationOn = true.obs;
  var isLoading = false.obs;
  final apiClient = Apiclient.instance;

  @override
  void onInit() {
    super.onInit();
    setBottomNav(0);
  }

  setBottomNav(int pos) {
    initialItemSelected.value = pos;
    update();
  }

  setNotification(bool value) {
    isNotificationOn.value = value;
    update();
  }

  callDelUserApi() async {
    Map<String, dynamic> map = {
      "userId": MyApp.box.read("id"),
    };

    try {
      isLoading.value = true;
      var data = await apiClient?.post(
          url: BASE_URL + "users/deleteAccount",
          body: map,
          context: Get.context!);
      var responce = DelUserModel.fromJson(data);
      isLoading.value = false;
      if (responce.code == 200) {
        toast(responce.message.toString());
        MyApp.box.remove("id");
        Get.off(Welcome());
      } else {
        toast(responce.message.toString());
      }
    } catch (e) {
      print("catch login>>$e");
    } finally {
      isLoading.value = false;
    }
  }
}
