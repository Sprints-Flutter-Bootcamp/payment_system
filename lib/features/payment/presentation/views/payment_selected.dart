import 'package:flutter/material.dart';
import 'package:payment_system/core/service/payment_service.dart';
import 'package:payment_system/core/widgets/my_app_bar.dart';
import 'package:payment_system/core/widgets/my_button.dart';
import 'package:payment_system/features/payment/data/models/payment_method.dart';

class PaymentSelected extends StatelessWidget {
  PaymentMethod paymentMethod;
  PaymentSelected({super.key, required this.paymentMethod});

  @override
  Widget build(BuildContext context) {
    String methodName = paymentMethod.getMethodName();
    PaymentProcessor Processor = PaymentProcessor(paymentMethod);

    return Scaffold(
      appBar: myAppBar(context, methodName),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            Text('Selected $methodName as Payment Method'),
            myButton("Pay", () {
              Processor.processPayment(100.0);
            }),
            Text(
              'There is no actual implementation yet',
              style: TextStyle(color: Colors.grey),
            ),
          ])),
    );
  }
}
