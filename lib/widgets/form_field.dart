import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    this.inputFormatters,
    this.validator,
    this.onChanged,
    required this.controller,
  });
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      validator: validator,
      style: const TextStyle(fontSize: 12),
      controller: controller,
      decoration: InputDecoration(
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
                color: Color.fromARGB(255, 212, 226, 169), width: 2)),
        errorStyle: const TextStyle(fontFamily: 'Poppins', fontSize: 12),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
                color: Color.fromARGB(255, 212, 226, 169), width: 2)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
                color: Color.fromARGB(255, 212, 226, 169), width: 2)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
                color: Color.fromARGB(255, 162, 210, 24), width: 2)),
      ),
    );
  }
}
