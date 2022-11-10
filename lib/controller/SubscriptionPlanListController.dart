import 'package:get/get.dart';
import 'package:stattrack/utils/commen.dart';
import 'package:stattrack/utils/constant.dart';

import '../main.dart';
import '../model/SubcriptionModel.dart';
import '../model/commonmodel.dart';
import '../network/apiClient.dart';
import '../ui/payment_screen.dart';

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

  bool isValidPaymentData(String selectedCardNum, String selectedCVC,
      String selectedMonth, String selectedYear) {
    if (selectedCardNum.isEmpty || selectedCardNum == "null") {
      toast("Please enter valid card number");
      return false;
    } else if (selectedCardNum.length < 16) {
      toast("Please enter valid card number");
      return false;
    } else if (selectedMonth.isEmpty || selectedMonth == "null") {
      toast("Please enter valid month");
      return false;
    } else if (selectedYear.isEmpty || selectedYear == "null") {
      toast("Please enter valid year");
      return false;
    } else if (selectedCVC.isEmpty || selectedCVC == "null") {
      toast("Please enter valid cvc number");
      return false;
    }
    return true;
  }

  doPayment(Subscriptionplans selectedplansLcl, String selectedCardNum,
      String selectedCVC, String selectedMonth, String selectedYear) async {
    var vv = isValidPaymentData(
        selectedCardNum, selectedCVC, selectedMonth, selectedYear);
    print("hi$selectedCardNum");
    if (vv) {
      Map<String, dynamic> map = {
        "user_id": MyApp.box.read("id"),
        // "user_id": "62e911ad79b4029289de8818",
        "subscription_id": selectedplansLcl.sId,
        // "subscription_id": "62e2435ca0bae5ec1e753654",
        "postal_code": "",
        "city": "",
        "state": "",
        "country": "",
        "card_number": selectedCardNum,
        "exp_month": selectedMonth,
        "exp_year": selectedYear,
        "cvc": selectedCVC,
        "amount": selectedplansLcl.planPrice,
        // "amount": "500",
      };
      try {
        print("doPayment");
        isLoading.value = true;
        var data = await apiClient?.post(
            url: BASE_URL + "payment/userpayment",
            body: map,
            context: Get.context!);

        CommonModel response = CommonModel.fromJson(data);

        // if (response.data?.subscriptionplans != null) {
        //   subscriptionplans.value = response.data!.subscriptionplans!;
        //   update();
        // }

        if (response.code == 200) {
          Get.offAll(PaymentScreen());
          print("${response.data?.type.toString()}");
        } else {
          print("${response.message}");
        }
        print("Payment Res>>${response.code}");
      } finally {
        isLoading.value = false;
      }
    }
  }
}
