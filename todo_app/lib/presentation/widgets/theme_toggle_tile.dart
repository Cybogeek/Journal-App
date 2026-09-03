import 'package:flutter/material.dart';

class ThemeToggleTile extends StatelessWidget {
  final bool isDark;
  final ValueChanged<bool> onChanged;

  const ThemeToggleTile({
    super.key,
    required this.isDark,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => onChanged(!isDark),
      icon: Icon(
        isDark ? Icons.star_rounded : Icons.dark_mode_outlined,
        color: isDark ? Colors.amber : Colors.black54,
      ),
    );
  }
}
