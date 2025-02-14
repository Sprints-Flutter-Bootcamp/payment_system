import 'package:payment_system/features/payment/data/models/payment_method.dart';

class FawryPayment implements PaymentMethod {
  @override
  void pay(double amount) {
    print('Paid \$$amount using FawryPay.');
  }

  @override
  String getMethodName() {
    return 'FawryPay';
  }
}
