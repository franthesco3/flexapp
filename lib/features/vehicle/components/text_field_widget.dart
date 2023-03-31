import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String label;
  String? errorText;
  final Function(String value) onChanged;

  TextFieldWidget({
    super.key,
    this.errorText,
    required this.label,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        errorText: errorText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        labelText: label,
      ),
    );
  }
}
