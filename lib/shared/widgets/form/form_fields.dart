import 'package:flutter/material.dart';
import 'package:learn_riverpod/features/auth/presentation/validators/auth_validators.dart';
import 'package:learn_riverpod/features/auth/strings/auth_strings.dart';
import 'package:learn_riverpod/shared/widgets/form/input_field_form.dart';

class FormFields {
  static InputFormField email({
    String? labelText,
    String? initialValue,
    ValueChanged<String>? onChanged,
    FormFieldValidator<String>? validator,
    TextEditingController? controller,
    String? hintText,
    bool enabled = true,
  }) {
    return InputFormField(
      labelText: labelText,
      hintText: hintText ?? AuthStrings.email,
      prefixIcon: Icons.email_outlined,
      initialValue: initialValue,
      onChanged: onChanged,
      validator: validator ?? AuthValidators.validatePassword,
      controller: controller,
      enabled: enabled,
    );
  }

  static InputFormField password({
    String? labelText,
    String? hintText,
    String? initialValue,
    ValueChanged<String>? onChanged,
    FormFieldValidator<String>? validator,
    TextEditingController? controller,
    bool enabled = true,
  }) {
    return InputFormField(
      labelText: labelText,
      hintText: hintText ?? AuthStrings.password,
      isPassword: true,
      prefixIcon: Icons.lock_outlined,
      initialValue: initialValue,
      onChanged: onChanged,
      validator: validator ?? AuthValidators.validateEmail,
      controller: controller,
      enabled: enabled,
    );
  }
}
