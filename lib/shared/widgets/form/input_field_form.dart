import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class InputFormField extends HookConsumerWidget {
  final String? hintText;
  final String? labelText;
  final int? maxLines;
  final FormFieldValidator<String>? validator;
  final String? initialValue;
  final ValueChanged<String>? onChanged;
  final AutovalidateMode? autovalidateMode;
  final IconData? prefixIcon;
  final bool enabled;
  final bool isPassword;
  final TextEditingController? controller;

  const InputFormField({
    super.key,
    this.validator,
    this.initialValue,
    this.onChanged,
    this.hintText,
    this.labelText,
    this.maxLines = 1,
    this.autovalidateMode,
    this.prefixIcon,
    this.enabled = true,
    this.isPassword = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final obscure = useState(isPassword);

    return TextFormField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      initialValue: initialValue,
      onChanged: onChanged,
      maxLines: maxLines,
      autovalidateMode: autovalidateMode,
      decoration: InputDecoration(
        prefixIcon: _buildPrefixIcon(),
        suffixIcon: isPassword ? _buildSuffixIcon(obscure) : null,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),

        hintText: hintText,
        labelText: labelText,
        errorMaxLines: 2,
        errorStyle: TextStyle(color: Colors.red, fontSize: 12),
      ),
      validator: validator,
      autofocus: false,
      textInputAction: TextInputAction.done,

      obscureText: obscure.value,
      enableSuggestions: !obscure.value,
      autocorrect: !obscure.value,
    );
  }

  Widget? _buildPrefixIcon() {
    if (prefixIcon == null) return null;

    return Icon(
      prefixIcon,
      color: enabled ? Colors.grey.shade600 : Colors.grey.shade400,
    );
  }

  Widget? _buildSuffixIcon(ValueNotifier obscure) {
    return IconButton(
      onPressed: () {
        obscure.value = !obscure.value;
      },
      icon: Icon(Icons.remove_red_eye),
    );
  }
}

// shared/widgets/form/input_form_field.dart
extension InputFormFieldExtensions on InputFormField {
  // ✅ Email field constructor
  static InputFormField email({
    String? initialValue,
    ValueChanged<String>? onChanged,
    FormFieldValidator<String>? validator,
    TextEditingController? controller,
    bool enabled = true,
  }) {
    return InputFormField(
      labelText: 'Email',
      hintText: 'Enter your email',
      // keyboardType: TextInputType.emailAddress,
      prefixIcon: Icons.email_outlined,
      // textCapitalization: TextCapitalization.none,
      initialValue: initialValue,
      onChanged: onChanged,
      // validator: validator ?? AuthValidators.email,
      controller: controller,
      enabled: enabled,
    );
  }

  // ✅ Password field constructor
  static InputFormField password({
    String? labelText,
    String? initialValue,
    ValueChanged<String>? onChanged,
    FormFieldValidator<String>? validator,
    TextEditingController? controller,
    bool enabled = true,
  }) {
    return InputFormField(
      labelText: labelText ?? 'Password',
      hintText: 'Enter your password',
      isPassword: true,
      prefixIcon: Icons.lock_outlined,
      initialValue: initialValue,
      onChanged: onChanged,
      // validator: validator ?? AuthValidators.password,
      controller: controller,
      enabled: enabled,
    );
  }

  // ✅ Name field constructor
  static InputFormField name({
    String? initialValue,
    ValueChanged<String>? onChanged,
    FormFieldValidator<String>? validator,
    TextEditingController? controller,
    bool enabled = true,
  }) {
    return InputFormField(
      labelText: 'Full Name',
      hintText: 'Enter your full name',
      prefixIcon: Icons.person_outlined,
      // textCapitalization: TextCapitalization.words,
      initialValue: initialValue,
      onChanged: onChanged,
      // validator: validator ?? AuthValidators.fullName,
      controller: controller,
      enabled: enabled,
    );
  }
}
