import 'package:get/get.dart';
import 'package:stattrack/utils/constant.dart';

import '../main.dart';
import '../model/SubcriptionModel.dart';
import '../model/paymentmodel.dart';
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

  doPayment(Subscriptionplans selectedplansLcl, String selectedCardNum,
      String selectedCVC, String selectedMonth, String selectedYear) async {
    Map<String, dynamic> map = {
      "user_id": MyApp.box.read("id"),
      "subscription_id": selectedplansLcl.sId,
      "postal_code": "",
      "city": "",
      "state": "",
      "country": "",
      "card_number": selectedCardNum,
      "exp_month": selectedMonth,
      "exp_year": selectedYear,
      "cvc": selectedCVC,
      "amount": selectedplansLcl.planPrice,
    };
    try {
      print("doPayment");
      isLoading.value = true;
      var data = await apiClient?.post(
          url: BASE_URL + "payment/userpayment",
          body: map,
          context: Get.context!);

      var response = PaymentModel.fromJson(data);

      // if (response.data?.subscriptionplans != null) {
      //   subscriptionplans.value = response.data!.subscriptionplans!;
      //   update();
      // }
sdfdsfsdfds

      if (response.code == 200) {
         print("{$response.message}");
      } else {
        print("{$response.message}");
      }
      print("length>>");
     
      // model.value = response;
    } finally {
      isLoading.value = false;
    }
  }
}
