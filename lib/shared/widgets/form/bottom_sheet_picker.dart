import 'package:flutter/material.dart';

class BottomSheetPicker<T> extends StatefulWidget {
  final List<T> items;
  final T? initialItem;
  final String title;
  final Function(T?)? onItemSelected;
  final Widget Function(T item, bool isSelected, Color selectedColor)
  itemBuilder;
  final Widget Function(T? item, Color selectedColor) previewBuilder;
  final int crossAxisCount;
  final double childAspectRatio;
  final Color selectedColor;

  const BottomSheetPicker({
    super.key,
    required this.items,
    required this.itemBuilder,
    required this.previewBuilder,
    this.initialItem,
    this.title = 'Select Item',
    this.onItemSelected,
    this.crossAxisCount = 6,
    this.childAspectRatio = 1.0,
    this.selectedColor = Colors.blue,
  });

  @override
  State<BottomSheetPicker<T>> createState() => _BottomSheetPickerState<T>();
}

class _BottomSheetPickerState<T> extends State<BottomSheetPicker<T>> {
  T? selectedItem;

  @override
  void initState() {
    super.initState();

    selectedItem = widget.initialItem;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(16),
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: showBottomSheet,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  widget.previewBuilder(selectedItem, widget.selectedColor),
                  const SizedBox(width: 12),
                  Text(
                    'Tap to select',
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void showBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Column(
                children: [
                  // Handle bar
                  Container(
                    margin: const EdgeInsets.only(top: 12),
                    height: 4,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),

                  // Header
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // Preview in modal
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: widget.selectedColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: widget.previewBuilder(
                            selectedItem,
                            widget.selectedColor,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: widget.crossAxisCount,
                                    childAspectRatio: widget.childAspectRatio,
                                    crossAxisSpacing: 8,
                                    mainAxisSpacing: 8,
                                  ),
                              itemCount: widget.items.length,
                              itemBuilder: (context, index) {
                                final item = widget.items[index];
                                final isSelected = selectedItem == item;

                                return GestureDetector(
                                  onTap: () {
                                    setModalState(() {
                                      selectedItem = item;
                                    });
                                    if (mounted) {
                                      setState(() {
                                        selectedItem = item;
                                      });
                                    }
                                    widget.onItemSelected?.call(item);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color:
                                          isSelected
                                              ? widget.selectedColor
                                                  .withOpacity(0.1)
                                              : Colors.grey.shade50,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color:
                                            isSelected
                                                ? widget.selectedColor
                                                : Colors.grey.shade300,
                                        width: isSelected ? 2 : 1,
                                      ),
                                    ),
                                    child: widget.itemBuilder(
                                      item,
                                      isSelected,
                                      widget.selectedColor,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),

                  // Done button
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: widget.selectedColor,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Done',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
