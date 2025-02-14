import 'package:payment_system/features/payment/data/models/payment_method.dart';

class CashPayment implements PaymentMethod {
  @override
  void pay(double amount) {
    print('Paid \$$amount using Cash.');
  }

  @override
  String getMethodName() {
    return 'Cash';
  }
}
