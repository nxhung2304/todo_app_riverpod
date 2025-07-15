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
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final obscure = useState(!isPassword);

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

        hintText: hintText,
        labelText: labelText,
        border: const OutlineInputBorder(),
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
