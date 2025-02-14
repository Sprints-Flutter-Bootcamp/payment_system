import 'package:flutter/material.dart';
import 'package:payment_system/core/widgets/my_app_bar.dart';
import 'package:payment_system/features/payment/data/models/payment_method.dart';

class PaymentSelected extends StatelessWidget {
  PaymentMethod paymentMethod;
  PaymentSelected({super.key, required this.paymentMethod});

  @override
  Widget build(BuildContext context) {
    String methodName = paymentMethod.getMethodName();
    return Scaffold(
      appBar: myAppBar(context, methodName),
      body: Center(child: Text('Selected $methodName as Payment Method')),
    );
  }
}
