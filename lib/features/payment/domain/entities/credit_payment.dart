import 'package:payment_system/features/payment/data/models/payment_method.dart';

class CreditCardPayment implements PaymentMethod {
  final String cardNumber;

  CreditCardPayment(this.cardNumber);

  @override
  void pay(double amount) {
    print('Paid \$$amount using Credit Card: $cardNumber.');
  }

  @override
  String getMethodName() {
    return 'Credit Card';
  }
}
