import 'package:flutter/material.dart';
import 'package:payment_system/core/service/payment_service.dart';
import 'package:payment_system/core/widgets/my_app_bar.dart';
import 'package:payment_system/core/widgets/my_button.dart';
import 'package:payment_system/core/widgets/my_text_field.dart';
import 'package:payment_system/features/payment/domain/entities/cash_payment.dart';
import 'package:payment_system/features/payment/domain/entities/credit_payment.dart';
import 'package:payment_system/features/payment/domain/entities/fawry_payment.dart';
import 'package:payment_system/features/payment/presentation/views/payment_selected.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _cardController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, "Payment System"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            MyTextField(
                controller: _amountController,
                label: "Amount to Pay",
                labelIcon: Icons.attach_money),
            SizedBox(height: 20),
            myButton('Cash on Delivery', () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) =>
                          PaymentSelected(paymentMethod: CashPayment())));
            }),
            myButton('Pay with FawryPay', () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) =>
                          PaymentSelected(paymentMethod: FawryPayment())));
            }),
            const Divider(),
            MyTextField(
                controller: _cardController,
                label: "Card Number",
                labelIcon: Icons.credit_card),
            myButton('Pay with Credit', () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => PaymentSelected(
                          paymentMethod:
                              CreditCardPayment(_cardController.text))));
            }),
          ],
        ),
      ),
    );
  }
}
