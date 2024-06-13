@JS()
library js_paystack_interop;

// ignore: avoid_web_libraries_in_flutter
import 'dart:js_util';

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

@JS()
external _imageIn(
    final double x, final double y, final double width, final double height);

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

  Future<dynamic> imageIn({
    required double x,
    required double y,
    required double width,
    required double height,
  }) async {
    final promise = await _imageIn(x, y, width, height);
    final data = await promiseToFuture(promise);
    return data;
  }
}
