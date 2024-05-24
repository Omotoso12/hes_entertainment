@JS()
library js_paystack_interop;

import 'package:js/js.dart';
import 'package:hes_entertainment/constant/payment_key.dart';

@JS()
external _paystackPopUp(
  final String pKtest,
  final String email,
  final String amount,
  final String ref,
  final void Function() onClosed,
  final void Function() callback,
);

class PaystackPopUp {
  void openPayWithPaystack({
    required String email,
    required String amount,
    required String ref,
    required void Function() whenClose,
    required void Function() whenSucess,
  }) {
    _paystackPopUp(publicKey, email, amount, ref, allowInterop(whenClose),
        allowInterop(whenSucess));
  }
}
