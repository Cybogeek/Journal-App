import 'package:flutter/material.dart';

class ColorPickerDialog extends StatelessWidget {
  final List<Color> colors;
  final Color selectedColor;

  const ColorPickerDialog({
    super.key,
    required this.colors,
    required this.selectedColor,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Choose Theme Color'),
      content: Wrap(
        spacing: 12,
        runSpacing: 12,
        children: colors.map((color) {
          final selected = color.toARGB32() == selectedColor.toARGB32();

          return GestureDetector(
            onTap: () => Navigator.pop(context, color),
            child: Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
                border: Border.all(
                  width: 3,
                  color: selected ? Colors.black : Colors.transparent,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
