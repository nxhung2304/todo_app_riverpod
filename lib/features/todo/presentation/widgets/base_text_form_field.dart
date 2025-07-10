import 'package:flutter/material.dart';

class BaseTextFormField extends StatelessWidget {
  final TextEditingController textFieldController;
  final String? hintText;
  final String? labelText;
  final int? maxLines;

  final FormFieldValidator<String> validator;

  const BaseTextFormField({
    super.key,
    required this.textFieldController,
    required this.validator,

    this.hintText,
    this.labelText,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textFieldController,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        border: const OutlineInputBorder(),

        errorMaxLines: 2,
        errorStyle: TextStyle(color: Colors.red, fontSize: 12),
      ),
      validator: validator,
      autofocus: true,
      textInputAction: TextInputAction.done,
    );
  }
}
