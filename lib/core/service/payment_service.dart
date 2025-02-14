import 'package:payment_system/features/payment/data/models/payment_method.dart';

class PaymentProcessor {
  final PaymentMethod paymentMethod;

  PaymentProcessor(this.paymentMethod);

  void processPayment(double amount) {
    paymentMethod.pay(amount);
  }
}
