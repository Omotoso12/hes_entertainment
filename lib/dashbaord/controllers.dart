import 'package:flutter/material.dart';

class AllControl {
  //final FocusNode? focus;
  final TextEditingController controller;
  GlobalKey<FormState> formKey;
  bool visible;
  double numb;

  AllControl(
      {required this.numb,
      required this.formKey,
      required this.visible,
      required this.controller})
      : super();
}
