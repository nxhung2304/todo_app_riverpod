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
  final TextInputAction? textInputAction;

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
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final obscure = useState(isPassword);

    return TextFormField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      controller: controller,
      initialValue: controller == null ? initialValue : null,
      onChanged: onChanged,
      maxLines: maxLines,
      autovalidateMode: autovalidateMode,
      decoration: InputDecoration(
        prefixIcon: _buildPrefixIcon(),
        suffixIcon: isPassword ? _buildSuffixIcon(obscure) : null,

        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),

        hintText: hintText,
        labelText: labelText,
        errorMaxLines: 2,
        errorStyle: TextStyle(color: Colors.red, fontSize: 12),
      ),
      validator: validator,
      autofocus: false,
      textInputAction: textInputAction ?? _getDefaultTextInputAction(),

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

  TextInputAction _getDefaultTextInputAction() {
    if (maxLines != null && maxLines! > 1) {
      return TextInputAction.newline;
    }
    return TextInputAction.next;
  }
}

extension InputFormFieldX on InputFormField {
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
      prefixIcon: Icons.email_outlined,
      initialValue: initialValue,
      onChanged: onChanged,
      controller: controller,
      enabled: enabled,
      textInputAction: TextInputAction.next
    );
  }

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
      controller: controller,
      enabled: enabled,
      textInputAction: TextInputAction.next
    );
  }

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
      initialValue: initialValue,
      onChanged: onChanged,
      controller: controller,
      enabled: enabled,
      textInputAction: TextInputAction.next
    );
  }
}
