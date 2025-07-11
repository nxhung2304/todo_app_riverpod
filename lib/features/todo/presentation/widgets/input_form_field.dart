import 'package:flutter/material.dart';

class InputFormField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final int? maxLines;
  final FormFieldValidator<String>? validator;
  final String? initialValue;
  final ValueChanged<String>? onChanged;

  const InputFormField({
    super.key,
    this.validator,
    this.initialValue,
    this.onChanged,
    this.hintText,
    this.labelText,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onChanged: onChanged,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        border: const OutlineInputBorder(),
        errorMaxLines: 2,
        errorStyle: TextStyle(color: Colors.red, fontSize: 12),
      ),
      validator: validator,
      autofocus: false,
      textInputAction: TextInputAction.done,
    );
  }
}
