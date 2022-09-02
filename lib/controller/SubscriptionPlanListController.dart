import 'package:get/get.dart';
import 'package:stattrack/utils/constant.dart';

import '../model/SubcriptionModel.dart';
import '../network/apiClient.dart';

class SubscriptionListController extends GetxController {
  var isLoading = false.obs;
  final apiClient = Apiclient.instance;
  var subscriptionplans = <Subscriptionplans>[].obs;
  var isSelected = 0.obs;

  @override
  void onInit() {
    super.onInit();

    callAPIPlanList();
  }

  callAPIPlanList() async {
    Map<String, dynamic> map = {};
    try {
      print("subscriptionList");
      isLoading.value = true;
      var data = await apiClient?.post(
          url: BASE_URL + "usersubscription/subscriptionList",
          body: map,
          context: Get.context!);

      var response = SubcriptionModel.fromJson(data);

      if (response.data?.subscriptionplans != null) {
        subscriptionplans.value = response.data!.subscriptionplans!;
        update();
      }
      print("length>>");
      print(response.data!.subscriptionplans!.length);
      // model.value = response;
    } finally {
      isLoading.value = false;
    }
  }
}
