import 'package:flutter/material.dart';
import 'package:learn_riverpod/shared/widgets/form/bottom_sheet_picker.dart';
import 'package:logger/web.dart';

class IconPicker extends StatelessWidget {
  final List<IconData> icons = [
    Icons.home,
    Icons.work,
    Icons.school,
    Icons.favorite,
    Icons.star,
    Icons.shopping_cart,
    Icons.restaurant,
    Icons.local_hospital,
    Icons.flight,
  ];

  final Function(IconData?) onIconSelected;
  final IconData? initialIcon;

  IconPicker({
    super.key,
    required this.onIconSelected,
    required this.initialIcon,
  });

  @override
  Widget build(BuildContext context) {
    return BottomSheetPicker<IconData>(
      items: icons,
      title: 'Select Icon',
      onItemSelected: onIconSelected,
      initialItem: initialIcon,
      itemBuilder: (icon, isSelected, selectedColor) {
        return Icon(
          icon,
          color: isSelected ? selectedColor : Colors.grey.shade700,
          size: 24,
        );
      },
      previewBuilder: (icon, selectedColor) {
        return Icon(icon ?? Icons.help_outline, color: selectedColor, size: 30);
      },
    );
  }
}
