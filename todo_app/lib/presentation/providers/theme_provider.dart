import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/storage/theme_storage.dart';
import 'auth_provider.dart';

class ThemeState {
  final ThemeMode themeMode;
  final Color seedColor;
  final String? userId;

  const ThemeState({
    required this.themeMode,
    required this.seedColor,
    required this.userId,
  });

  ThemeState copyWith({
    ThemeMode? themeMode,
    Color? seedColor,
    String? userId,
    bool updateUserId = false,
  }) {
    return ThemeState(
      themeMode: themeMode ?? this.themeMode,
      seedColor: seedColor ?? this.seedColor,
      userId: updateUserId ? userId : this.userId,
    );
  }
}

final themeStorageProvider = Provider<ThemeStorage>((ref) {
  return ThemeStorage();
});

class ThemeController extends AsyncNotifier<ThemeState> {
  @override
  Future<ThemeState> build() async {
    final authUser = ref.watch(authStateProvider).value;
    final userId = authUser?.uid;

    final storage = ref.read(themeStorageProvider);
    final mode = await storage.loadThemeMode(userId);
    final color = await storage.loadSeedColor(userId);

    return ThemeState(themeMode: mode, seedColor: color, userId: userId);
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    final current = state.value;
    if (current == null) return;

    final updated = current.copyWith(themeMode: mode);
    state = AsyncData(updated);

    await ref
        .read(themeStorageProvider)
        .saveThemeMode(userId: current.userId, mode: mode);
  }

  Future<void> toggleDark(bool value) async {
    await setThemeMode(value ? ThemeMode.dark : ThemeMode.light);
  }

  Future<void> setSeedColor(Color color) async {
    final current = state.value;
    if (current == null) return;

    final updated = current.copyWith(seedColor: color);
    state = AsyncData(updated);

    await ref
        .read(themeStorageProvider)
        .saveSeedColor(userId: current.userId, color: color);
  }
}

final themeControllerProvider =
    AsyncNotifierProvider<ThemeController, ThemeState>(ThemeController.new);
