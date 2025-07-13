import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateFormField extends StatefulWidget {
  final DateTime? initialDate;
  final String? labelText;
  final FormFieldValidator<DateTime>? validator;
  final ValueChanged<DateTime?>? onChanged;

  const DateFormField({
    super.key,
    this.initialDate,
    this.labelText,
    this.validator,
    this.onChanged,
  });

  @override
  State<DateFormField> createState() => _DateFormFieldState();
}

class _DateFormFieldState extends State<DateFormField> {
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
  }

  @override
  Widget build(BuildContext context) {
    return FormField<DateTime>(
      initialValue: _selectedDate,
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      builder: (FormFieldState<DateTime> field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: _selectedDate ?? DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2030),
                );
                if (picked != null) {
                  setState(() {
                    _selectedDate = picked;
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
                      _selectedDate != null
                          ? DateFormat('dd/MM/yyyy').format(_selectedDate!)
                          : widget.labelText ?? 'Chọn ngày',
                      style: TextStyle(
                        color:
                            _selectedDate != null ? Colors.black : Colors.grey,
                      ),
                    ),
                    Icon(Icons.calendar_today, color: Colors.grey),
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
