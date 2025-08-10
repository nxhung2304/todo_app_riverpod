import 'package:flutter/material.dart';
import 'package:learn_riverpod/shared/widgets/form/bottom_sheet_picker.dart';

class ColorPicker extends StatelessWidget {
  final List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.purple,
    Colors.pink,
    Colors.teal,
    Colors.amber,
  ];
  final Function(Color?) onColorSelected;
  final Color initialColor;

  ColorPicker({
    super.key,
    required this.onColorSelected,
    required this.initialColor,
  });

  @override
  Widget build(BuildContext context) {
    return BottomSheetPicker<Color>(
      items: colors,
      title: 'Select Color',
      crossAxisCount: 4,
      childAspectRatio: 1.2,
      onItemSelected: onColorSelected,
      initialItem: initialColor,
      itemBuilder: (color, isSelected, selectedColor) {
        return Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(
              color: isSelected ? Colors.black : Colors.grey.shade300,
              width: isSelected ? 3 : 1,
            ),
          ),
          child: isSelected ? Icon(Icons.check, color: Colors.white) : null,
        );
      },
      previewBuilder: (color, selectedColor) {
        return Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: color ?? Colors.grey,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey.shade300),
          ),
        );
      },
    );
  }
}
