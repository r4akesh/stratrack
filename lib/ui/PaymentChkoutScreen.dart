import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../utils/commen.dart';
import '../utils/constant.dart';

class PaymentChkoutScreen extends StatelessWidget {
  const PaymentChkoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Column(
        children: [
          Text("Card Information"),
          CardField(
            dangerouslyGetFullCardDetails: true,
            dangerouslyUpdateFullCardDetails: true,
            onCardChanged: (card) {
              print("card>>{$card}");
              var ccc = card?.cvc.toString();
              var exp = card?.expiryMonth.toString();
              var year = card?.expiryYear.toString();
              var crd = card?.number;
              print("card{$ccc>>>$exp>>$crd>>$year}");
            },
          ),
          TextButton(
            onPressed: () async {
              // create payment method
              //final paymentMethod = await Stripe.instance.createPaymentMethod(PaymentMethodParams.card());
            },
            child: Text('pay'),
          )
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      toolbarHeight: 100,
      title: appText(
        "Payment2",
        txtColor: Colors.white,
      ),
      centerTitle: true,
      elevation: 0,
      flexibleSpace: Image.asset(
        topHeaderImg,
        fit: BoxFit.fill,
      ),
    );
  }
}
