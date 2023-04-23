import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.label,
    this.onChanged,
    this.error = false,
  }) : super(key: key);

  final String label;
  final Function(String)? onChanged;
  final bool error;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        enabledBorder: error
            ? const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red))
            : const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black38)),
        labelText: label,
        labelStyle: TextStyle(color: error ? Colors.red : Colors.black38),
        suffixIconColor: error ? Colors.red : Colors.black38,
        suffixIcon:
            error ? const Icon(Icons.error) : const Icon(Icons.cancel_outlined),
      ),
      onChanged: onChanged,
    );
  }
}
