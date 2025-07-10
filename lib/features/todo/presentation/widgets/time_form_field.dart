import 'package:flutter/material.dart';

class TimeFormField extends StatefulWidget {
  final TimeOfDay? initialTime;
  final String? labelText;
  final FormFieldValidator<TimeOfDay>? validator;
  final ValueChanged<TimeOfDay?>? onChanged;

  const TimeFormField({
    super.key,
    this.initialTime,
    this.labelText,
    this.validator,
    this.onChanged,
  });

  @override
  State<TimeFormField> createState() => _TimeFormFieldState();
}

class _TimeFormFieldState extends State<TimeFormField> {
  TimeOfDay? _selectedTime;

  @override
  void initState() {
    super.initState();
    _selectedTime = widget.initialTime;
  }

  @override
  Widget build(BuildContext context) {
    return FormField<TimeOfDay>(
      initialValue: _selectedTime,
      validator: widget.validator,
      builder: (FormFieldState<TimeOfDay> field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () async {
                final TimeOfDay? picked = await showTimePicker(
                  context: context,
                  initialTime: _selectedTime ?? TimeOfDay.now(),
                );
                if (picked != null) {
                  setState(() {
                    _selectedTime = picked;
                  });
                  field.didChange(picked);
                  widget.onChanged?.call(picked);
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _selectedTime != null
                          ? _selectedTime!.format(context)
                          : widget.labelText ?? 'Chọn thời gian',
                      style: TextStyle(
                        color: _selectedTime != null ? Colors.black : Colors.grey,
                      ),
                    ),
                    Icon(Icons.access_time, color: Colors.grey),
                  ],
                ),
              ),
            ),
            if (field.hasError)
              Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text(
                  field.errorText!,
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
          ],
        );
      },
    );
  }
}
