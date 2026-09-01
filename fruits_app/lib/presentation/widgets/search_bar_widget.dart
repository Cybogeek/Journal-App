import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const SearchBarWidget({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: 'Search fruits by name...',
        prefixIcon: const Icon(Icons.search),
        suffixIcon: const Icon(Icons.apple),
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
      ),
    );
  }
}
