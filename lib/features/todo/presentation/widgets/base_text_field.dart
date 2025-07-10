import 'package:flutter/material.dart';

class BaseTextField extends StatelessWidget {
  final TextEditingController textFieldController;
  final String? hintText;
  final String? labelText;
  final int? maxLines;

  const BaseTextField({
    super.key,
    required this.textFieldController,

    this.hintText,
    this.labelText,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textFieldController,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
