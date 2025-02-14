# Flutter Payment System (SOLID Principles)
*This app is used to learn and apply the SOLID principles*

A simple and **payment system** designed using the **SOLID principles** for learning and to make the app the clean, maintainable, and extendable code.


## 🛠️ SOLID Principles in Action

###  **S - Single Responsibility Principle (SRP)**
- Each class has **only one reason to change**.
- Like  
  - `CashPayment` handles only **cash transactions**.  
  - `CreditPayment` handles only **credit card transactions**.
  - `FawryPayment` handles only **Fawry payment method**. 
  - `PaymentProcessor` is responsible **only for processing payments**, not handling UI.  

```dart
class CashPayment implements PaymentMethod {
  @override
  void pay(double amount) {
    print("Paid \$${amount.toStringAsFixed(2)} in cash.");
  }
}
```
---

### **O - Open/Closed Principle (OCP)**
The system is open for extension but closed for modification.
We can add new payment methods without modifying existing code.

```dart
abstract class PaymentMethod {
  void pay(double amount);
}
```

 Now, if we add PayPalPayment, we don’t need to modify PaymentProcessor. Instead, we just create a new class:

``` dart
 class PayPalPayment implements PaymentMethod {
  @override
  void pay(double amount) {
    print("Paid \$${amount.toStringAsFixed(2)} using PayPal.");
  }
}
```
---

###  **L - Liskov Substitution Principle (LSP)**
Objects of a superclass should be replaceable with objects of its subclasses without breaking the system.
The PaymentProcessor class can use any PaymentMethod without modifying its behavior.

``` dart
void main() {
  PaymentProcessor processor = PaymentProcessor(CreditPayment());
  processor.processPayment(200.0);
}
```

---

### **I - Interface Segregation Principle (ISP)**
Clients should not be forced to depend on methods they don’t use.
Our PaymentMethod interface has methods: pay() and getMethodName which all payments have.
This avoids forcing unnecessary methods onto payment classes.

``` dart
abstract class PaymentMethod {
  void pay(double amount);
  String getMethodName();
}

```

---

### **D - Dependency Inversion Principle (DIP)**
High-level modules (PaymentProcessor) should depend on abstractions (PaymentMethod), not concrete implementations (CashPayment, CreditPayment).
The PaymentProcessor doesn’t care which payment method is used.

``` dart
class PaymentProcessor {
  final PaymentMethod paymentMethod;

  PaymentProcessor(this.paymentMethod);

  void processPayment(double amount) {
    paymentMethod.pay(amount);
  }
}
```