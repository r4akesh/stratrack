import 'package:get/get.dart';

class DashboardController extends GetxController {
  var initialItemSelected = 0.obs;
  var isNotificationOn = true.obs;

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

 
}
