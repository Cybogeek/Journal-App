import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fruits_app/presentation/providers/theme_provider.dart';

import 'core/theme/app_theme.dart';
import 'presentation/screens/fruits_list_screen.dart';

void main() {
  runApp(const ProviderScope(child: FruitsApp()));
}

class FruitsApp extends ConsumerWidget {
  const FruitsApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    return MaterialApp(
      title: 'Fruits Explorer',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      home: const FruitsListScreen(),
    );
  }
}
