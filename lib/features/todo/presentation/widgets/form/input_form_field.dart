import 'package:flutter/material.dart';

class InputFormField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final int? maxLines;
  final FormFieldValidator<String>? validator;
  final String? initialValue;
  final ValueChanged<String>? onChanged;
  final AutovalidateMode? autovalidateMode;

  const InputFormField({
    super.key,
    this.validator,
    this.initialValue,
    this.onChanged,
    this.hintText,
    this.labelText,
    this.maxLines = 1,
    this.autovalidateMode,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      initialValue: initialValue,
      onChanged: onChanged,
      maxLines: maxLines,
      autovalidateMode: autovalidateMode,
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
